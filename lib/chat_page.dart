import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/chat_bubble.dart';
import 'package:learn_flutter/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi Duminda!"),
        actions: [
          IconButton(
            onPressed: () => {print("logout Clicked")},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ChatBubble(
                  alignment: Alignment.centerLeft,
                  message: "Hi I'm duminda",
                ),
                ChatBubble(alignment: Alignment.centerRight, message: "Oh Hi"),
              ],
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
