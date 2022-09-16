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

class _HomeScreenState extends State<HomeScreen> {
  final List<GuestModel> _listGuest = [];
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
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    NetworkImage(_listGuest[index].avatar),
                              ),
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
    final route = MaterialPageRoute(
      builder: (context) => GuestDetails(model: guest),
    );
    Navigator.push(context, route);
  }
}
