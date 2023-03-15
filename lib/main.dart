import 'package:flutter/material.dart';
import 'package:textgram/login.dart';
import 'package:textgram/signup.dart';
import 'package:textgram/home.dart';

void main() => runApp(MaterialApp(
      initialRoute: 'login',
      routes: {
        'login': (context) => Mylogin(),
        'signup': (context) => MySignup(),
        'home': (context) => Home()
      },
    ));
