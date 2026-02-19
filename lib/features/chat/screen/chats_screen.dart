import 'package:care_agent/features/chat/screen/chatdetails_screen.dart';
import 'package:care_agent/features/chat/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
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
    super.dispose();
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': text});
      _showPlaceholderImage = false;
      _messageController.clear();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _messages.add({
          'sender': 'bot',
          'text': "MedAI: I received your message \"$text\""
        });
      });
    });
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