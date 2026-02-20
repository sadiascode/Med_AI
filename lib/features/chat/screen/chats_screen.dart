import 'dart:async';
import 'package:care_agent/features/chat/screen/chatdetails_screen.dart';
import 'package:care_agent/features/chat/widget/custom_text.dart';
import 'package:care_agent/features/chat/services/chat_service.dart';
import 'package:care_agent/features/chat/models/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../auth/services/auth_service.dart';
import '../../../common/app_shell.dart';

class ChatsScreenContent extends StatefulWidget {
  const ChatsScreenContent({super.key});

  @override
  State<ChatsScreenContent> createState() => _ChatsScreenContentState();
}

class _ChatsScreenContentState extends State<ChatsScreenContent> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _showPlaceholderImage = true;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    print(' User message: "$text"');
    print(' Current messages count: ${_messages.length}');

    setState(() {
      _messages.add({'sender': 'user', 'text': text});
      _showPlaceholderImage = false;
      _messageController.clear();

      _messages.add({'sender': 'bot', 'text': 'Typing...', 'isTyping': true});
    });

    try {
      print(' Calling ChatService.sendMessage()');
      print(' API call started at: ${DateTime.now()}');
      

      final currentUserId = await _getCurrentUserId();
      final authToken = await _getCurrentAuthToken();
      
      print(' Using user ID: $currentUserId');
      print(' Auth token available: ${authToken.isNotEmpty}');
      
      final ChatModel response = await ChatService.sendMessage(text, currentUserId, token: authToken);
      
      print(' API Response received: $response');
      print(' Response text: "${response.response}"');
      print(' Response type: ${response.messageType}');
      print(' API call completed at: ${DateTime.now()}');
      
      setState(() {

        _messages.removeWhere((element) => element['isTyping'] == true);
        print(' Removed typing messages');
        

        _messages.add({
          'sender': 'bot',
          'text': response.response ?? 'Sorry, I could not process your message.',
          'type': response.messageType ?? 'text',
          'conversationId': response.conversationId,
        });
        
        print(' Updated messages count: ${_messages.length}');
      });
    } on TimeoutException {
      print(' Error in _sendMessage: TimeoutException');
      
      setState(() {

        _messages.removeWhere((msg) => msg['isTyping'] == true);
        print(' Removed typing messages');

        _messages.add({
          'sender': 'bot',
          'text': 'Response took too long. Please try again.',
          'type': 'error',
          'shouldRetry': true,
          'errorType': 'timeout',
        });

        print(' Updated messages count after error: ${_messages.length}');
        print('Should retry: true');
      });
    } catch (e) {
      print(' Error in _sendMessage: $e');
      print(' Error Type: ${e.runtimeType}');
      print(' Error Stack Trace: ${StackTrace.current}');

      String errorMessage = 'Something went wrong. Please try again.';
      bool shouldRetry = false;
      String errorType = 'unknown';

      final errorString = e.toString().toLowerCase();

      if (errorString.contains('authentication') ||
          errorString.contains('401') ||
          errorString.contains('unauthorized')) {
        errorMessage = 'Authentication failed. Please log in again.';
        shouldRetry = false;
        errorType = 'authentication';
      } else if (errorString.contains('network') ||
                 errorString.contains('socket') ||
                 errorString.contains('connection')) {
        errorMessage = 'Network error. Please check your connection.';
        shouldRetry = true;
        errorType = 'network';
      } else if (errorString.contains('parse') ||
                 errorString.contains('json') ||
                 errorString.contains('format')) {
        errorMessage = 'Server response format error. Please try again.';
        shouldRetry = true;
        errorType = 'parse';
      } else if (errorString.contains('timeout')) {
        errorMessage = 'Request timeout. Please try again.';
        shouldRetry = true;
        errorType = 'timeout';
      }
      
      setState(() {
        _messages.removeWhere((msg) => msg['isTyping'] == true);
        print(' Removed typing messages');

        _messages.add({
          'sender': 'bot',
          'text': errorMessage,
          'type': 'error',
          'shouldRetry': shouldRetry,
          'errorType': errorType,
          'debugInfo': e.toString(),
        });
        
        print('Updated messages count after error: ${_messages.length}');
        print(' Should retry: $shouldRetry');
        print(' Error type: $errorType');
      });
    }

    _scrollToBottom();
  }

  Future<int> _getCurrentUserId() async {
    try {
      return AuthService.currentUserId;
    } catch (e) {
      print(' Error getting user ID: $e');
      return 0;
    }
  }

  Future<String> _getCurrentAuthToken() async {
    try {
      return '';
    } catch (e) {
      print(' Error getting auth token: $e');
      return '';
    }
  }

  void _sendVoiceMessage(Map<String, dynamic> voiceData) {
    setState(() {
      _messages.add({
        'sender': 'user',
        'type': 'voice',
        'audioPath': voiceData['audioPath'],
        'duration': voiceData['duration'],
      });
      _showPlaceholderImage = false;
    });

    _scrollToBottom();
  }

  Future<void> _playVoiceMessage(String audioPath) async {
    try {
      await _audioPlayer.play(DeviceFileSource(audioPath));
    } catch (e) {
      print('Error playing voice message: $e');
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF7),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Chat",
          style: TextStyle(
            color: Color(0xffE0712D),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Color(0xffE0712D)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChatdetailsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemCount: _messages.length + (_showPlaceholderImage ? 1 : 0),
              itemBuilder: (context, index) {
                if (_showPlaceholderImage && index == 0) {
                  return Center(
                    child: Image.asset(
                      'assets/text.png',
                      height: 300,
                      width: 300,
                    ),
                  );
                }

                final msgIndex = _showPlaceholderImage ? index - 1 : index;
                final msg = _messages[msgIndex];
                final isUser = msg['sender'] == 'user';
                final messageType = msg['type'] ?? 'text';
                final isTyping = msg['isTyping'] == true;
                
                // Show typing indicator
                if (isTyping) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        "Typing...",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  );
                }
                
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    decoration: BoxDecoration(
                      color: isUser ? const Color(0xFFE0712D) : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: isUser ? null : Border.all(color: Colors.grey.shade300),
                    ),
                    child: messageType == 'voice'
                        ? GestureDetector(
                            onTap: () => _playVoiceMessage(msg['audioPath']),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: isUser ? Colors.white : const Color(0xFFE0712D),
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Voice message",
                                  style: TextStyle(
                                    color: isUser ? Colors.white : Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Text(
                            msg['text'],
                            style: TextStyle(
                              color: isUser ? Colors.white : Colors.black,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomText(
                messageController: _messageController,
                onSend: (text) {
                  _sendMessage(text);
                  _scrollToBottom();
                },
                onVoiceRecorded: (voiceData) {
                  _sendVoiceMessage(voiceData);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppShell(initialIndex: 3);
  }
}