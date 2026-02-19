import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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
  void dispose() {
    if (_isRecording) {
      _cancelRecording();
    }
    super.dispose();
  }

  Future<void> _startRecording() async {
    try {

      final PermissionStatus permissionStatus = await Permission.microphone.status;
      
      if (permissionStatus.isDenied) {

        final PermissionStatus newStatus = await Permission.microphone.request();
        if (newStatus.isDenied) {
          _showSnackBar('Microphone permission denied');
          return;
        }
      } else if (permissionStatus.isPermanentlyDenied) {
        _showSnackBar('Microphone permission permanently denied. Please enable in app settings.');

        await openAppSettings();
        return;
      }

      if (_isRecording) return;


      final Directory tempDir = await getTemporaryDirectory();
      final String fileName = 'voice_${DateTime.now().millisecondsSinceEpoch}.wav';
      _currentRecordingPath = '${tempDir.path}/$fileName';


      setState(() {
        _isRecording = true;
      });
      _recordingStartTime = DateTime.now();
    } catch (e) {
      _showSnackBar('Error starting recording: ${e.toString()}');
    }
  }

  Future<void> _stopRecording() async {
    if (!_isRecording) return;

    try {

      final int duration = _recordingStartTime != null
          ? DateTime.now().difference(_recordingStartTime!).inSeconds
          : 0;


      if (duration < 1) {
        _cancelRecording();
        return;
      }


      if (widget.onVoiceRecorded != null) {
        widget.onVoiceRecorded!({
          'audioPath': _currentRecordingPath,
          'duration': duration,
        });
      }
    } catch (e) {
      _showSnackBar('Error stopping recording: ${e.toString()}');
    } finally {
      setState(() {
        _isRecording = false;
      });
      _currentRecordingPath = null;
      _recordingStartTime = null;
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
      if (_currentRecordingPath != null && await File(_currentRecordingPath!).exists()) {
        await File(_currentRecordingPath!).delete();
      }
    } catch (e) {
      print('Error canceling recording: $e');
    } finally {
      setState(() {
        _isRecording = false;
      });
      _currentRecordingPath = null;
      _recordingStartTime = null;
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