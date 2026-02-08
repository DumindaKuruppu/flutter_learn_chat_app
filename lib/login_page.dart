import 'package:flutter/material.dart';
import 'package:learn_flutter/utils/spacers.dart';
import 'package:learn_flutter/widgets/login_text.dart';
import 'package:social_media_buttons/social_media_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print("Login Success!");
      print(userNameController.text);
      print(passwordController.text);
      Navigator.pushReplacementNamed(
        context,
        '/chat',
        arguments: userNameController.text,
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
              verticalSpacing(24),
              Image.asset('assets/illustration.png', height: 200),
              verticalSpacing(24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: 'Enter your username',
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
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      hintText: 'Enter your password',
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
                      hasAsterisks: true,
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.github(),
                    SocialMediaButton.instagram(),
                    SocialMediaButton.twitter(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
