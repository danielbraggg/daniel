import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  MyTextField(
      {this.userNameText,
      this.passwordText,
      this.myheight,
      this.emailController,
      this.passwordController});

  final String userNameText;
  final String passwordText;
  final double myheight;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              borderSide: BorderSide(color: Colors.black, width: .0),
            ),
            labelText: userNameText,
          ),
        ),
        SizedBox(height: myheight),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              borderSide: BorderSide(color: Colors.black, width: .0),
            ),
            labelText: passwordText,
          ),
        ),
      ],
    );
  }
}
