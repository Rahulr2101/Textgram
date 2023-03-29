import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:textgram/login.dart';
import 'package:textgram/signup.dart';
import 'package:textgram/home.dart';
import 'package:textgram/Authpage.dart';
import 'package:textgram/Verifyemailid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    navigatorKey: navigatorkey,
    home: MainPage(),
  ));
}

final navigatorkey = GlobalKey<NavigatorState>();

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        } else if (snapshot.hasData) {
          return VerifyEmail();
        } else {
          return AuthPage();
        }
      },
    ));
  }
}
