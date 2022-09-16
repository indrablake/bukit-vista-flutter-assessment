import 'package:bukit_vista/utils/appbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAccount());
}

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bukit Vista Assesment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Notification(
        title: 'My Account',
      ),
    );
  }
}

class Notification extends StatefulWidget {
  const Notification({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Notification> createState() => _NotificationState();
}

class _NotificationState extends State<Notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            bottom: Radius.circular(15),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
            ),
          ),
        ],
        bottom: PreferredSize(
            child: AppbarWidget.getAppBottomViewGlobal(),
            preferredSize: const Size.fromHeight(10.0)),
      ),
      body: const Padding(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Text(
              'Account Page',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
