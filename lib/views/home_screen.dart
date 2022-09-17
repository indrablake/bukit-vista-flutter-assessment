import 'dart:convert';

import 'package:bukit_vista/model/guest.dart';
import 'package:bukit_vista/utils/appbar.dart';
import 'package:bukit_vista/views/guest_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<GuestModel> _listGuest = [];
  late AnimationController controller;
  late Animation<Offset> offset;
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/guest.json');
    final data = await json.decode(response);
    setState(() {
      for (var item in data) {
        _listGuest.add(GuestModel.fromJson(item));
      }
    });
  }

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0))
        .animate(controller);
    readJson();
    super.initState();
  }

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
            bottom: Radius.circular(10),
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
            child: AppbarWidget.getAppBottomView(),
            preferredSize: const Size.fromHeight(110.0)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            _listGuest.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _listGuest.length,
                      itemBuilder: (context, index) {
                        GuestModel model = _listGuest[index];
                        return Card(
                          margin: const EdgeInsets.all(10),
                          child: ListTile(
                            leading: Hero(
                              tag: 'avatar-' + _listGuest[index].id,
                              child: ClipOval(
                                  child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholder:
                                    'assets/user.png', // Before image load
                                image: _listGuest[index]
                                    .avatar, // After image load
                                height: 50,
                                width: 50,
                              )),
                            ),
                            title: Text(_listGuest[index].name),
                            subtitle: Text(_listGuest[index].origin),
                            trailing: const Icon(Icons.arrow_right),
                            onTap: () => _openDetail(context, model),
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox(
                    height: 35,
                    width: 35,
                    child: CircularProgressIndicator(color: Colors.blue),
                  )
          ],
        ),
      ),
    );
  }

  _openDetail(context, guest) {
    Navigator.push(
      context,
      PageRouteBuilder<dynamic>(
        pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) =>
            GuestDetails(model: guest),
        transitionsBuilder: (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          final Tween<Offset> offsetTween = Tween<Offset>(
              begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0));
          final Animation<Offset> slideInFromTheRightAnimation =
              offsetTween.animate(animation);
          return SlideTransition(
              position: slideInFromTheRightAnimation, child: child);
        },
      ),
    );
  }
}
