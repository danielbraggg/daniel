import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';
import 'bloc/login_state.dart';
import 'login_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.newData}) : super(key: key);
  final String title;
  final String newData;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  LoginBloc loginBloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);

    super.initState();
  }

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
          appBar: AppBar(
            title: Text('title'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Icon(
                    Icons.directions_transit,
                    size: 150,
                  )),
                  SizedBox(height: 50),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                  SizedBox(height: 20),
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
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
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
                        print(emailController.text);
                        print(passwordController.text);
                        print('Pressed');
                        loginBloc.add(LoginCarketaAPIEvent(
                            email: emailController.text,
                            password: passwordController.text));
                      },
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      labelText: 'Email',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
