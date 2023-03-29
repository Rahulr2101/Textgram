import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:textgram/main.dart';
import 'package:textgram/signup.dart';
import 'package:basic_utils/basic_utils.dart';

class Mylogin extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const Mylogin({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/reading_0re1.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 365),
            child: const Text(
              'Welcome, back!',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              'Please Log In',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
            child: Column(children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: 'Username',
                    fillColor: const Color.fromARGB(-1, 241, 226, 204),
                    filled: true,
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    fillColor: Color.fromARGB(-1, 241, 226, 204),
                    filled: true,
                    prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(-1, 122, 82, 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      fixedSize: Size(380, 60)),
                  child: Text(
                    'Log in',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                color: Colors.black54,
                endIndent: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => widget.onClickedSignUp(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(-1, 122, 82, 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      fixedSize: Size(380, 60)),
                  child: const Text(
                    'Create an Account',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )),
            ]),
          )
        ]),
      ),
    );
  }

  Future signIn() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      final snackBar = SnackBar(
        content: Text((e.message).toString()),
      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }
}
