import 'package:flutter/material.dart';
import 'package:learn_flutter/counter_demo.dart';
import 'package:learn_flutter/models/chat_message_entity.dart';
import 'package:learn_flutter/widgets/chat_bubble.dart';
import 'package:learn_flutter/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});

  final List<ChatMessageEntity> _messages = [
    ChatMessageEntity(
      author: Author(userName: 'duminda'),
      createdAt: 2131231242,
      id: '1',
      text: 'Hi',
    ),
    ChatMessageEntity(
      author: Author(userName: 'pooja'),
      createdAt: 2131231442,
      id: '1',
      text: 'ඇයි මොකද?',
      imageUrl: 'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
    ),
    ChatMessageEntity(
      author: Author(userName: 'duminda'),
      createdAt: 2131234242,
      id: '1',
      text: 'Bye!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;

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
              onPressed: () => {Navigator.pushReplacementNamed(context, '/')},
              icon: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  alignment: _messages[index].author.userName == 'duminda'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  entity: _messages[index],
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
