import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:textgram/main.dart';

class MySignup extends StatefulWidget {
  final Function() onClickedSignIn;
  const MySignup({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<MySignup> createState() => _MySignupState();
}

class _MySignupState extends State<MySignup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/home_hero.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 365),
            child: const Text(
              'Hi,there!',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: const Text(
              "Let's Get Started",
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
                    fillColor: const Color.fromARGB(-1, 241, 226, 204),
                    filled: true,
                    prefixIcon: const Icon(Icons.key),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: SignUp,
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(-1, 122, 82, 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      fixedSize: const Size(380, 60)),
                  child: const Text(
                    'Create an Account',
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
                  onPressed: () => widget.onClickedSignIn(),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(-1, 122, 82, 22),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      fixedSize: const Size(380, 60)),
                  child: const Text(
                    'Login',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  )),
            ]),
          )
        ]),
      ),
    );
  }

  Future SignUp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }
}
