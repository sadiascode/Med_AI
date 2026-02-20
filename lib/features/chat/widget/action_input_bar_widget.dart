import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import '../services/voice_recording_service.dart';
import '../services/voice_chat_service.dart';

class ActionInputBarWidget extends StatefulWidget {
  final VoidCallback? onTap;
  final Function(Map<String, dynamic>)? onVoiceRecorded;

  const ActionInputBarWidget({super.key, this.onTap, this.onVoiceRecorded});

  @override
  State<ActionInputBarWidget> createState() => _ActionInputBarWidgetState();
}

class _ActionInputBarWidgetState extends State<ActionInputBarWidget> {
  bool _isRecording = false;
  String? _currentRecordingPath;
  DateTime? _recordingStartTime;

  @override
  void initState() {
    super.initState();
    _initializeVoiceService();
  }

  @override
  void dispose() {
    if (_isRecording) {
      _cancelRecording();
    }
    VoiceRecordingService.dispose();
    super.dispose();
  }

  Future<void> _initializeVoiceService() async {
    try {
      final initialized = await VoiceRecordingService.initialize();
      if (!initialized) {
        _showSnackBar('Voice recording initialization failed');
      }
    } catch (e) {
      print('❌ Error initializing voice service: $e');
      _showSnackBar('Failed to initialize voice recording');
    }
  }

  Future<void> _startRecording() async {
    try {
      if (_isRecording) {
        print('⚠️ Already recording');
        return;
      }

      print('🎤 Starting voice recording...');
      
      // Start recording using VoiceRecordingService
      final recordingPath = await VoiceRecordingService.startRecording();
      
      if (recordingPath == null) {
        _showSnackBar('Failed to start recording. Please check microphone permissions.');
        return;
      }

      setState(() {
        _isRecording = true;
        _currentRecordingPath = recordingPath;
        _recordingStartTime = DateTime.now();
      });

      print('✅ Recording started: $recordingPath');
    } catch (e) {
      print('❌ Error starting recording: $e');
      _showSnackBar('Error starting recording: ${e.toString()}');
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;

    try {
      print('🛑 Stopping voice recording...');
      
      // Stop recording using VoiceRecordingService
      final recordingPath = await VoiceRecordingService.stopRecording();
      
      if (recordingPath == null) {
        print('❌ Recording failed or was too short');
        _showSnackBar('Recording failed or was too short. Please record for at least 1 second.');
        setState(() {
          _isRecording = false;
          _currentRecordingPath = null;
          _recordingStartTime = null;
        });
        return;
      }

      final int duration = _recordingStartTime != null
          ? DateTime.now().difference(_recordingStartTime!).inSeconds
          : 0;

      print('✅ Recording stopped: $recordingPath');
      print('⏱️ Duration: $duration seconds');

      // Send voice message to API
      await _sendVoiceMessage(recordingPath, duration);
    } catch (e) {
      print('❌ Error stopping recording: $e');
      _showSnackBar('Error stopping recording: ${e.toString()}');
    } finally {
      setState(() {
        _isRecording = false;
        _recordingStartTime = null;
      });
    }
  }

  Future<void> _sendVoiceMessage(String audioPath, int duration) async {
    try {
      // Get current user ID (you can modify this based on your auth system)
      final userId = 6; // TODO: Replace with dynamic user ID

      print('📤 Sending voice message: $audioPath (${duration}s)');

      // Call callback with voice data for local display immediately
      if (widget.onVoiceRecorded != null) {
        widget.onVoiceRecorded!({
          'audioPath': audioPath,
          'duration': duration,
        });
      }

      try {
        // Send voice message to API
        final response = await VoiceChatService.sendVoiceMessage(
          audioPath: audioPath,
          userId: userId,
        );

        // Call callback with API response for bot message
        if (widget.onVoiceRecorded != null) {
          widget.onVoiceRecorded!({
            'sender': 'bot',
            'text': response.response ?? 'Voice message sent',
            'type': 'voice',
            'conversationId': response.conversationId,
            'voiceUrl': response.voiceUrl,
            'createdAt': response.createdAt,
          });
        }

        // Clean up temporary file after successful upload
        await VoiceChatService.cleanupTempFile(audioPath);

        print('✅ Voice message sent successfully');
      } catch (apiError) {
        print('⚠️ API failed but local voice message saved: $apiError');
        
        // Add error message but keep the voice message
        if (widget.onVoiceRecorded != null) {
          widget.onVoiceRecorded!({
            'sender': 'bot',
            'text': 'Voice message saved locally (API failed)',
            'type': 'error',
          });
        }
      }
    } catch (e) {
      print('❌ Error sending voice message: $e');
      _showSnackBar('Error sending voice message: ${e.toString()}');
    }
  }

  void _showSnackBar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _cancelRecording() async {
    try {
      print('🚫 Canceling voice recording...');
      
      // Cancel recording using VoiceRecordingService
      await VoiceRecordingService.cancelRecording();
      
      setState(() {
        _isRecording = false;
        _currentRecordingPath = null;
        _recordingStartTime = null;
      });

      print('✅ Recording canceled');
    } catch (e) {
      print('❌ Error canceling recording: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xffFFFAF7),
          border: Border.all(color: const Color(0xFFE67E22).withOpacity(0.4)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () async {
                final ImagePicker picker = ImagePicker();
                // Capture a photo.
                final XFile? photo = await picker.pickImage(
                    source: ImageSource.camera
                );
              },
              child: SvgPicture.asset(
                'assets/camera.svg',
                height: 32,
                width: 32,
              ),
            ),

            Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  print('Mic tapped');
                },
                onLongPress: _startRecording,
                onLongPressUp: _stopRecording,
                child: AnimatedScale(
                  scale: _isRecording ? 0.85 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: _isRecording ? Colors.redAccent : const Color(0xFFE67E22),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: ()
              async {
                final ImagePicker picker = ImagePicker();
                // Pick an image.
                final XFile? image = await picker.pickImage(
                  source: ImageSource.gallery,
                );
              },
              child: SvgPicture.asset(
                'assets/plus.svg',
                height: 32,
                width: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}