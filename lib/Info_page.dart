import 'package:flutter/material.dart';

import 'model/login_model.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({this.loginModel});

  final LoginModel loginModel;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String firstNameText = 'empty';
  String lastNameText = 'empty';
  String ageText = 'empty';
  String usernameText = 'empty';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(firstNameText),
            Text(lastNameText),
            Text(ageText),
            Text(usernameText),
            Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  child: Text('Update'),
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
                    firstNameText = widget.loginModel.data.firstName;
                    lastNameText = widget.loginModel.data.lastName;
                    ageText = widget.loginModel.data.age;
                    usernameText = widget.loginModel.data.username;
                    setState(() {});
                    print('Pressed');
                  },
                ))
          ],
        ),
      ),
    );
  }
}
