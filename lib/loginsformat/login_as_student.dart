import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system_01/backEnd/services/auth.dart';
import 'package:school_management_system_01/loginsformat/platFormAlertDialog.dart';
import 'package:school_management_system_01/loginsformat/validators.dart';
import 'package:wc_form_validators/wc_form_validators.dart';
import 'package:school_management_system_01/dashboardResponsible/dashboard.dart';

class LoginAsStudent extends StatefulWidget
    with EmailAndPasswordValidators {
  LoginAsStudent({required this.auth});
  final AuthBase auth;
  @override
  _LoginAsStudentState createState() => _LoginAsStudentState();
}

class _LoginAsStudentState extends State<LoginAsStudent> {
  String get _email => _emailController.text;
  String get _password => _passwordController.text;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _submitted = false;

  Future<void> _signInAnonymously() async {
    try {
      await widget.auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    //TODO: Show EmailSignInPage
  }

  void _submit() async {
    //TODO: print Email and Password
    setState(() {
      _submitted = true;
    });
    try {
      await widget.auth.signInWithEmailAndPassword(_email, _password);
    } catch (e) {
      //await PlatformAlertDialog(
      //    title: 'Sign In Failed',
      //    content: e.toString(),
      //    defaultActionText: "ok", cancelActionText: '',).show(context);
      print(('ffff'));
    }
  }

  void _emailEditingComplete() {
    FocusScope.of(context).requestFocus(_passwordFocusNode);
  }

  @override
  Widget build(BuildContext context) {
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: new Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                title: Text(' LOGIN AS STUDENT ',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(color: Colors.blue.shade900, fontSize: 18)),
                leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios,
                      color: Colors.blue.shade900),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
              ),
            ),
          ),
          SizedBox(height: 100.0),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.alternate_email),
                      hintText: 'What is your Email?',
                      labelText: 'Email',
                    ),
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onChanged: (email) => _updateState(),
                  ),
                  SizedBox(height: 40.0),
                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.enhanced_encryption_outlined),
                      hintText: 'What is your gmail password?',
                      labelText: 'PassWord',
                    ),
                    obscureText: true,
                    focusNode: _passwordFocusNode,
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    controller: _passwordController,
                    onChanged: (password) => _updateState(),
                    onEditingComplete: submitEnabled ? _submit : null,
                  ),
                  SizedBox(height: 100.0),
                  ElevatedButton(
                    onPressed: _submit
                    //Navigator.push(
                    //  context,
                    //  MaterialPageRoute(builder: (context) => DashboardResponsible()),
                    //);
                    ,
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0, vertical: 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.blue.shade900),
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateState() {
    setState(() {});
  }
}
