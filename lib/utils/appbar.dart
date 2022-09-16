import 'package:flutter/material.dart';

class AppbarWidget {
  static getAppBottomView() {
    return Container(
        padding: const EdgeInsets.only(bottom: 35, left: 35, right: 35),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search your guest name',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SizedBox(
                width: 57,
                height: 57,
                child: ElevatedButton(
                  child: const Icon(
                    Icons.filter_list,
                    size: 30,
                  ),
                  onPressed: () {},
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.orange),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  static getAppBottomViewGlobal() {
    return SizedBox(
      height: 50,
      child: Container(),
    );
  }
}
