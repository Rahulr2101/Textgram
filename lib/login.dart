import 'package:flutter/material.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'home');
                  },
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
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'signup');
                  },
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
}
