import 'package:flutter/material.dart';
import 'package:learn_flutter/chat_page.dart';
import 'package:learn_flutter/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => AuthService(),
      child: ChatApp(),
    ),
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
      home: FutureBuilder<bool>(
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data == true) {
              return ChatPage();
            } else {
              return LoginPage();
            }
          }
          return CircularProgressIndicator();
        },
        future: context.watch<AuthService>().isLoggedIn(),
      ),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
