import 'package:bukit_vista/model/guest.dart';
import 'package:flutter/material.dart';

class GuestDetails extends StatefulWidget {
  final GuestModel model;
  const GuestDetails({Key? key, required this.model}) : super(key: key);

  @override
  State<GuestDetails> createState() => _GuestDetailsState();
}

class _GuestDetailsState extends State<GuestDetails>
    with SingleTickerProviderStateMixin {
  // late final id = widget.index;
  int currentPage = 0;
  final List<Widget> myTabs = [
    const Tab(text: 'Overview'),
    const Tab(text: 'Bookings'),
    const Tab(text: 'Personal'),
  ];
  late TabController _controller;
  late TabController _tabController;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  @override
  void dispose() {
    // _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
              backgroundColor: const Color.fromARGB(255, 11, 148, 221),
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20, top: 12),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              title: const Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 30, top: 12),
                  child: Text(
                    'Guest Details',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ))),
      body: Column(children: [
        profilDetails(),
        DefaultTabController(
          length: 3,
          animationDuration: Duration.zero,
          initialIndex: currentPage,
          child: TabBar(
            indicatorWeight: 2,
            controller: _controller,
            labelColor: Colors.grey,
            tabs: myTabs,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: [
              overviewActivity(),
              bookingActivity(context),
              // ignore: prefer_const_literals_to_create_immutables
              Column(children: [
                const Center(
                  child: Text(
                    'Personal',
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ]),
            ],
          ),
        )
        // tabDetailGuest(context),
      ]),
    );
  }

  profilDetails() {
    return Hero(
      tag: 'avatar-' + widget.model.id,
      child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Card(
              elevation: 3,
              shape: const BeveledRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(255, 216, 214, 214), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              margin: const EdgeInsets.all(10),
              child: ClipRect(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(widget.model.avatar),
                  ),
                  title: Text(
                    widget.model.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black),
                  ),
                  subtitle: Text('Guest since' + ' ' + widget.model.joindate,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: Colors.grey)),
                ),
              ))),
    );
  }

  tabDetailGuest(context) {
    return Expanded(
      child: TabBar(
        isScrollable: true,
        indicatorWeight: 2.0,
        labelPadding: EdgeInsets.only(right: 250.0, left: 40.0),
        indicatorPadding: EdgeInsets.only(left: 40.0),
        controller: _controller,
        tabs: [
          Tab(
            icon: Icon(Icons.directions_car),
            text: 'Car',
          ),
          Tab(
            icon: Icon(Icons.directions_transit),
            text: 'Transit',
          ),
          Tab(
            icon: Icon(Icons.directions_bike),
            text: 'Bike',
          ),
        ],
      ),
    );
  }

  overviewActivity() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 2, top: 12),
            child: Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 8, top: 12),
            child: Text(widget.model.email),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 2, top: 12),
            child: Text('Phone Number',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 8, top: 12),
            child: Text(widget.model.phone),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, bottom: 2, top: 12),
            child: Text('Guest Origin',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 8, top: 12),
            child: Text(widget.model.origin),
          ),
        ],
      ),
    );
  }

  bookingActivity(context) {
    // ignore: avoid_unnecessary_containers
    return Container(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.model.booking.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
                child: SizedBox(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    semanticContainer: false,
                    elevation: 3,
                    shape: const BeveledRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 216, 214, 214),
                            width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    margin: const EdgeInsets.all(10),
                    // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
                    child: Container(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: 25,
                                  width: 100,
                                  decoration: widget.model.booking[index]
                                              .bookingStatus ==
                                          'confirmed'
                                      ? BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 103, 253, 155),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 52, 243, 65),
                                          ),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10)))
                                      : BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 243, 189, 169),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 243, 189, 169),
                                          ),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10))),
                                  child: widget.model.booking[index]
                                              .bookingStatus ==
                                          'confirmed'
                                      ? const Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Text(
                                            'Confirmed',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 25, 222, 22),
                                            ),
                                          ),
                                        )
                                      : const Padding(
                                          padding: EdgeInsets.all(2.0),
                                          child: Text(
                                            'Canceled',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 250, 51, 11),
                                            ),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 230, 205, 151),
                                  // border: Border.all(
                                  //   color: Colors.grey,
                                  // ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: const SizedBox(
                                height: 33,
                                width: 33,
                                child: Icon(
                                  Icons.home,
                                  size: 23,
                                  color: Color.fromARGB(255, 239, 161, 27),
                                ),
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Text(
                                            widget
                                                .model.booking[index].bookingId,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text(
                                    widget.model.booking[index].bookingName,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                                Text(
                                  widget.model.booking[index].bookingStartDate +
                                      ' ' +
                                      widget
                                          .model.booking[index].bookingEndDate,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                              ],
                            ),

                            // subtitle: const Text('Pondok Lulik #20'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
