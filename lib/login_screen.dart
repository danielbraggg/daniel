import 'dart:ffi';

import 'package:daniel_project/loginbutton.dart';
import 'package:daniel_project/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';
import 'login_icon.dart';
import 'Info_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.newData}) : super(key: key);
  final String title;
  final String newData;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LoginBloc loginBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) async {
          if (state is LoginLoadingState) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Loading'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {},
              ),
            ));
          }
          if (state is LoginFailedState) {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text('Error'),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () {},
              ),
            ));
          }
          if (state is LoginSuccessState) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => WelcomePage(
                      loginModel: state.loginModel,
                    )));
          }
        },
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Center(
                      child: MyIcon(
                    icon: Icons.access_alarm,
                    size: 200,
                  )),
                  MyTextField(
                    userNameText: 'username',
                    emailController: emailController,
                    myheight: 25,
                    passwordText: 'password',
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 50),
                  MyButton(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
