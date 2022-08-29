import 'package:flutter/material.dart';

import '../model/threemodel.dart';

class Listnearbymaker extends StatelessWidget {
  Threemodel model;
  Listnearbymaker({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var title = model.title;
    var date = model.date;
    var subject = model.subject;
    var image = model.image;
    var venue = model.venue;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: height * 0.17,
        // color: Colors.blue,
        child: Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(20.0),
            ),
            shadowColor: Colors.black,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$title"),
                      Column(
                        children: [
                          Text("Address: $venue"),
                          Text("Date: $date"),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: height * 0.109,
                        width: width * 0.29,
                        // color: Colors.purple,
                        child: Image.asset(
                          image,
                          fit: BoxFit.contain,
                        )),
                    Container(
                        height: height * 0.109,
                        width: width * 0.52,
                        // color: Colors.purple,
                        child: Text("$subject"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}