import 'package:bukit_vista/splash.dart';
import 'package:bukit_vista/views/account.dart';
import 'package:bukit_vista/views/booking.dart';
import 'package:bukit_vista/views/home_screen.dart';
import 'package:bukit_vista/views/notification.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bukit Vista Assesment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(title: 'Guest List'),
    const MyBooking(),
    const MyNotif(),
    const MyAccount(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
                fontSize: 17, color: Colors.white, letterSpacing: 0.53),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(0),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              // child: Icon(
              //   Icons.notifications,
              //   size: 20,
              // ),
            ),
          ),
        ],
      ),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

/* Bottom Navigation bar */
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? Icon(
                    Icons.home_filled,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  )
                : const Icon(
                    Icons.home_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? Icon(
                    Icons.work_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  )
                : const Icon(
                    Icons.work_outline_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? Icon(
                    Icons.notifications,
                    color: Theme.of(context).primaryColor,
                    size: 35,
                  )
                : const Icon(
                    Icons.notifications_none,
                    color: Colors.grey,
                    size: 30,
                  ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  )
                : const Icon(
                    Icons.person_outline,
                    color: Colors.grey,
                    size: 30,
                  ),
          ),
        ],
      ),
    );
  }
}
