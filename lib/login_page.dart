import 'package:flutter/material.dart';
import 'package:learn_flutter/chat_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print("Login Success!");
      print(userNameController.text);
      print(passwordController.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatPage(userName: userNameController.text),
        ),
      );
    } else {
      print("not successfully");
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                textAlign: TextAlign.center,
                "Let's Sign you in!",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                "Welcome back! \n You've been missed!",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Username should be more than 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Username is required!";
                        }
                        return null;
                      },
                      controller: userNameController,
                      decoration: InputDecoration(
                        hint: Text("Enter your username"),
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Password should be more than 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Password is required!";
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hint: Text("Enter your password"),
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Column(children: [Text("@dumindaKuruppu")]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
