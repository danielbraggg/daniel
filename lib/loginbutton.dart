import 'package:daniel_project/bloc/login_bloc.dart';
import 'package:daniel_project/bloc/login_event.dart';
import 'package:daniel_project/calculator_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyButton extends StatefulWidget {
  MyButton({this.emailController, this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  LoginBloc loginBloc;
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        child: Text('Login'),
        style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          primary: Colors.blue,
          onPrimary: Colors.white,
          textStyle: TextStyle(
            fontSize: 25,
          ),
        ),
        onPressed: () {
        
          loginBloc.add(LoginCarketaAPIEvent(
              email: widget.emailController.text,
              password: widget.passwordController.text));
        },
      ),
    ));
  }
}
