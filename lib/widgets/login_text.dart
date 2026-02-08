import 'package:flutter/material.dart';
import '../utils/textField_styles.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final FormFieldValidator<String> validator;
  final bool hasAsterisks;
  const LoginTextField({
    super.key,
    required this.controller,
    required this.validator,
    required this.hintText,
    this.hasAsterisks = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hasAsterisks,
      validator: (value) {
        return validator(value);
      },
      controller: controller,
      decoration: InputDecoration(
        hint: Text(hintText),
        hintStyle: ThemeTextStyle.loginTextFieldStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }
}
