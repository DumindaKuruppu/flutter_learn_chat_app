import 'package:flutter/material.dart';
import 'package:learn_flutter/services/auth_service.dart';
import 'package:learn_flutter/utils/spacers.dart';
import 'package:learn_flutter/widgets/login_text.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formKey = GlobalKey<FormState>();

  Future<void> loginUser(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      await context.read<AuthService>().loginUser(userNameController.text);
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

  Widget _buildHeader(context) {
    return Column(
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
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/illustration.png'),
            ),
          ),
        ),
        verticalSpacing(24),
      ],
    );
  }

  Widget _buildFooter() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SocialMediaButton.github(),
          SocialMediaButton.instagram(),
          SocialMediaButton.twitter(),
        ],
      ),
    );
  }

  Widget _buildForm(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              LoginTextField(
                hintText: 'Enter your username',
                validator: (value) {
                  if (value != null && value.isNotEmpty && value.length < 5) {
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
                  if (value != null && value.isNotEmpty && value.length < 5) {
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
          onPressed: () async {
            await loginUser(context);
          },
          child: Text(
            "Login",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: LayoutBuilder(
            builder: (context, BoxConstraints constraints) {
              if (constraints.maxWidth > 1000) {
                return Row(
                  children: [
                    Spacer(flex: 1),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [_buildHeader(context), _buildFooter()],
                      ),
                    ),
                    Spacer(flex: 1),
                    Expanded(child: _buildForm(context)),
                    Spacer(flex: 1),
                  ],
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  _buildForm(context),
                  _buildFooter(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
