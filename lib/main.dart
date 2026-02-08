import 'package:flutter/material.dart';
import 'package:learn_flutter/chat_page.dart';

import 'login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.yellow),
      home: ChatPage(),
    );
  }
}
