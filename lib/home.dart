import 'package:flutter/material.dart';
import 'package:textgram/database_service.dart';
import 'package:textgram/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userName = "hi";
  bool _isLoading = false;
  String groupName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Textgram',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 180, 143, 94),
          // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
              color: Colors.white,
            ),
          ]),
      drawer: const NavigationDrawer(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                child: Icon(
              Icons.star_rounded,
              color: Colors.yellow,
              size: 100.0,
            )),
            SizedBox(
              height: 20,
            ),
            Align(
                child: Text('Welcome To Textgram',
                    style: TextStyle(
                      color: Color.fromARGB(255, 148, 137, 112),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ))),
            Align(
              child: Text('Start messaging by tapping the pencil button '),
            )
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          popUpDialog(context);
        },
        child: Icon(
          Icons.edit,
        ),
        backgroundColor: Color.fromARGB(255, 122, 89, 46),
      ),
    );
  }

  popUpDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Create a group",
              textAlign: TextAlign.left,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor),
                      )
                    : TextField(
                        onChanged: (val) {
                          setState(() {
                            groupName = val;
                          });
                        },
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(20)),
                            errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(20))),
                      )
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () {},
                child: Text("CANCEL"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
              ),
              ElevatedButton(
                onPressed: () {
                  if (groupName != "") {
                    setState(() {
                      _isLoading = true;
                    });
                    DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                        .createGroup(userName,
                            FirebaseAuth.instance.currentUser!.uid, groupName)
                        .whenComplete(() {
                      _isLoading = false;
                    });
                    Navigator.of(context).pop();
                    SnackBar snackBar = SnackBar(
                      content: Text('Group created sucessfully.'),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text("CREATE"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
              )
            ],
          );
        });
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [buildHeader(context), buildMenuItems(context)],
        ),
      ));

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
      );
  Widget buildMenuItems(BuildContext context) => Column(children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('contacts'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text("Sign out"),
          onTap: () => FirebaseAuth.instance.signOut(),
        )
      ]);
}
