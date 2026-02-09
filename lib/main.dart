import 'package:flutter/material.dart';
import 'package:learn_flutter/chat_page.dart';
import 'package:learn_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

void main() {
  runApp(
    Provider(create: (BuildContext context) => AuthService(), child: ChatApp()),
  );
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
        ),
      ),
      home: LoginPage(),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
