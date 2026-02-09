import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/counter_demo.dart';
import 'package:learn_flutter/models/chat_message_entity.dart';
import 'package:learn_flutter/models/image_modal.dart';
import 'package:learn_flutter/repository/image_repository.dart';
import 'package:learn_flutter/widgets/chat_bubble.dart';
import 'package:learn_flutter/widgets/chat_input.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    rootBundle
        .loadString("assets/mock_messages.json")
        .then((response) {
          final List<dynamic> decodedList = jsonDecode(response) as List;
          final List<ChatMessageEntity> chatMessages = decodedList.map((
            listItem,
          ) {
            return ChatMessageEntity.fromJson(listItem);
          }).toList();

          print(response);
          setState(() {
            _messages = chatMessages;
          });
        })
        .then((_) {
          print("Done!");
        });
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

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
          ChatInput(onSubmit: onMessageSent),
        ],
      ),
    );
  }
}
