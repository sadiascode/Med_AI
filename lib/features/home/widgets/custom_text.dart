import 'package:care_agent/features/home/widgets/action_input_bar_widget.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final TextEditingController messageController;
  final Function(String) onSend;

  const CustomText({
    super.key,
    required this.messageController,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE0712D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE0712D)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 11),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Color(0xffFFFAF7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: 'Chat with MedAI.....',
                      hintStyle: TextStyle(
                        color: Color(0xFFFF6B35),
                        fontSize: 15,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    onSend(messageController.text);
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Color(0xFFFF6B35),
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ActionInputBarWidget(),
        ],
      ),
    );
  }
}
