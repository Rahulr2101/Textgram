import 'package:flutter/material.dart';
import 'package:textgram/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        onPressed: () {},
        child: Icon(
          Icons.edit,
        ),
        backgroundColor: Color.fromARGB(255, 122, 89, 46),
      ),
    );
  }
}

// class NavigationDrawer extends StatelessWidget {
//   const NavigationDrawer({super.key});

//   @override
//   Widget build(BuildContext context) => Drawer(
//           child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [buildHeader(context), buildMenuItems(context)],
//         ),
//       ));

//   Widget buildHeader(BuildContext context) => Container(
//         padding: EdgeInsets.only(
//           top: MediaQuery.of(context).padding.top,
//         ),
//       );
//   Widget buildMenuItems(BuildContext context) => Column(children: [
//         ListTile(
//           leading: Icon(Icons.home),
//           title: Text('Home'),
//           onTap: () {},
//         ),
//         ListTile(
//           leading: Icon(Icons.people),
//           title: Text('contacts'),
//           onTap: () {},
//         )
//       ]);
// }
// ;
//   }
// }

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text(
//             'Textgram',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           backgroundColor: Color.fromARGB(255, 180, 143, 94),
//           // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: const Icon(Icons.search),
//               color: Colors.white,
//             ),
//           ]),
//       drawer: const NavigationDrawer(),
//       body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Align(
//                 child: Icon(
//               Icons.star_rounded,
//               color: Colors.yellow,
//               size: 100.0,
//             )),
//             SizedBox(
//               height: 20,
//             ),
//             Align(
//                 child: Text('Welcome To Textgram',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 148, 137, 112),
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20.0,
//                     ))),
//             Align(
//               child: Text('Start messaging by tapping the pencil button '),
//             )
//           ]),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(
//           Icons.edit,
//         ),
//         backgroundColor: Color.fromARGB(255, 122, 89, 46),
//       ),
//     );
//   }
// }

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
        )
      ]);
}
