import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecordingService {
  static AudioRecorder? _audioRecorder;
  static AudioPlayer? _audioPlayer;
  static String? _currentRecordingPath;
  static bool _isInitialized = false;

  static Future<bool> initialize() async {
    try {
      if (_isInitialized) return true;


      _audioRecorder = AudioRecorder();
      _audioPlayer = AudioPlayer();


      final status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        print('Microphone permission denied: $status');
        return false;
      }

      _isInitialized = true;
      print(' VoiceRecordingService initialized');
      return true;
    } catch (e) {
      print(' Error initializing VoiceRecordingService: $e');
      return false;
    }
  }

  static Future<String?> startRecording() async {
    try {
      if (!_isInitialized) {
        final initialized = await initialize();
        if (!initialized) return null;
      }

      if (_audioRecorder == null) {
        print(' Audio recorder not initialized');
        return null;
      }


      if (await _audioRecorder!.isRecording()) {
        print(' Already recording');
        return null;
      }


      final tempDir = await getTemporaryDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'voice_recording_$timestamp.wav';
      _currentRecordingPath = path.join(tempDir.path, fileName);

      print(' Starting recording to: $_currentRecordingPath');


      await _audioRecorder!.start(
        const RecordConfig(
          encoder: AudioEncoder.wav,
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: _currentRecordingPath!,
      );


      await Future.delayed(const Duration(milliseconds: 100));


      final isRecording = await _audioRecorder!.isRecording();
      if (!isRecording) {
        print(' Failed to start recording');
        _currentRecordingPath = null;
        return _currentRecordingPath;
      }

      print('Recording started: $_currentRecordingPath');
      return _currentRecordingPath;
    } catch (e) {
      print(' Error starting recording: $e');
      _currentRecordingPath = null;
      return null;
    }
  }

  static Future<String?> stopRecording() async {
    try {
      if (_audioRecorder == null) {
        print(' Audio recorder not initialized');
        return null;
      }


      final isRecording = await _audioRecorder!.isRecording();
      if (!isRecording) {
        print(' No recording in progress');
        return null;
      }

      print(' Stopping recording...');
      await _audioRecorder!.stop();


      await Future.delayed(const Duration(milliseconds: 500));


      if (_currentRecordingPath == null) {
        print(' No recording path available');
        return null;
      }

      final file = File(_currentRecordingPath!);
      final exists = await file.exists();
      
      if (!exists) {
        print(' Audio file not created: $_currentRecordingPath');
        return null;
      }

      final fileSize = await file.length();
      if (fileSize == 0) {
        print(' Audio file is empty: $_currentRecordingPath');
        await file.delete();
        return null;
      }


      if (fileSize < 22050) {
        print(' Recording too short: ${fileSize} bytes');
        await file.delete();
        return null;
      }

      final finalPath = _currentRecordingPath!;
      _currentRecordingPath = null;

      print(' Recording stopped successfully');
      print('File: $finalPath');
      print('Size: ${fileSize} bytes');

      return finalPath;
    } catch (e) {
      print(' Error stopping recording: $e');
      _currentRecordingPath = null;
      return null;
    }
  }

  static Future<void> cancelRecording() async {
    try {
      if (_audioRecorder == null) return;

      final isRecording = await _audioRecorder!.isRecording();
      if (isRecording) {
        await _audioRecorder!.stop();
      }


      if (_currentRecordingPath != null) {
        final file = File(_currentRecordingPath!);
        if (await file.exists()) {
          await file.delete();
          print(' Deleted incomplete recording: $_currentRecordingPath');
        }
        _currentRecordingPath = null;
      }

      print(' Recording canceled');
    } catch (e) {
      print(' Error canceling recording: $e');
    }
  }

  static Future<void> playAudio(String path, {bool isUrl = false}) async {
    try {
      if (_audioPlayer == null) {
        print(' Audio player not initialized');
        return;
      }


      await _audioPlayer!.stop();

      if (isUrl) {
        await _audioPlayer!.play(UrlSource(path));
        print(' Playing from URL: $path');
      } else {
        final file = File(path);
        if (!await file.exists()) {
          print(' Audio file not found: $path');
          return;
        }
        await _audioPlayer!.play(DeviceFileSource(path));
        print(' Playing from file: $path');
      }
    } catch (e) {
      print(' Error playing audio: $e');
    }
  }

  static Future<void> stopPlayback() async {
    try {
      if (_audioPlayer != null) {
        await _audioPlayer!.stop();
        print(' Audio playback stopped');
      }
    } catch (e) {
      print(' Error stopping playback: $e');
    }
  }

  static Future<bool> isRecording() async {
    try {
      return _audioRecorder != null && await _audioRecorder!.isRecording();
    } catch (e) {
      print(' Error checking recording status: $e');
      return false;
    }
  }

  static Future<void> cleanupTempFile(String filePath) async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        await file.delete();
        print(' Cleaned up temporary file: $filePath');
      }
    } catch (e) {
      print(' Failed to cleanup temporary file: $e');
    }
  }

  static void dispose() {
    try {
      _audioRecorder?.dispose();
      _audioPlayer?.dispose();
      _audioRecorder = null;
      _audioPlayer = null;
      _currentRecordingPath = null;
      _isInitialized = false;
      print(' VoiceRecordingService disposed');
    } catch (e) {
      print(' Error disposing VoiceRecordingService: $e');
    }
  }
}
