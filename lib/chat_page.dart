import 'package:flutter/material.dart';
import 'package:learn_flutter/counter_demo.dart';
import 'package:learn_flutter/widgets/chat_bubble.dart';
import 'package:learn_flutter/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  final String userName;
  const ChatPage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi $userName!"),
        actions: [
          GestureDetector(
            onLongPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CounterDemo(buttonColor: Colors.black),
                ),
              );
            },
            child: IconButton(
              onPressed: () => {Navigator.pop(context)},
              icon: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return ChatBubble(
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  message: "Hello I'm Duminda",
                );
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
