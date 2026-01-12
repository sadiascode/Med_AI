import 'package:care_agent/common/navbar/custom_bottom_navbar.dart';
import 'package:care_agent/features/doctor/screen/doctor_screen.dart';
import 'package:care_agent/features/home/screen/chatdetails_screen.dart';
import 'package:care_agent/features/home/screen/home_screen.dart';
import 'package:care_agent/features/home/widgets/custom_text.dart';
import 'package:care_agent/features/medicine/screen/medicine_screen.dart';
import 'package:care_agent/features/notification/screen/notification_screen.dart';
import 'package:care_agent/features/profile/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    MedicineScreen(),
    DoctorScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  final List<Map<String, dynamic>> _messages = [];

  final TextEditingController _messageController = TextEditingController();

  bool _showPlaceholderImage = true;

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

  final ScrollController _scrollController = ScrollController();

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

      appBar: _selectedIndex == 0
          ? AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xffE0712D),
            size: 18,
          ),
        ),
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChatdetailsScreen()),
              );
            },
            icon: const Icon(
              Icons.more_vert,
              color: Color(0xffE0712D),
              size: 24,
            ),
          ),
        ],
      )
          : null,

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Column(
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
                    return Align(
                      alignment: isUser
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 14),
                        decoration: BoxDecoration(
                          color: isUser ? const Color(0xFFE0712D) : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: isUser
                              ? null
                              : Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
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
                  padding: EdgeInsets.only(bottom: 16),
                  child: CustomText(
                    messageController: _messageController,
                    onSend: (text) {
                      _sendMessage(text);
                      _scrollToBottom();
                    },
                  ),
                ),
              ),
            ],
          ),

          ..._screens.sublist(1),
        ],
      ),

      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
