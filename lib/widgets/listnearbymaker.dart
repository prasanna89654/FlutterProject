// ignore_for_file: must_be_immutable, sized_box_for_whitespace

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
        height: height * 0.19,
        // color: Colors.blue,
        child: Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 3, color: Color.fromARGB(255, 245, 242, 251)),
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Container(
                    height: height * 0.05,
                    // color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: height * 0.03,
                          width: width * 0.30,
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("$title"),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: height * 0.02,
                                width: width * 0.51,
                                // color: Colors.red,
                                child: Text(
                                  "Address: $venue",
                                  maxLines: 1,
                                )),
                            Container(
                                height: height * 0.02,
                                width: width * 0.51,
                                // color: Colors.red,
                                child: Text(
                                  "Date: $date",
                                  maxLines: 1,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Container(
                          height: height * 0.110,
                          width: width * 0.359,
                          // color: Colors.purple,
                          child: Image.asset(
                            image,
                            fit: BoxFit.contain,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6, bottom: 6),
                      child: Container(
                          height: height * 0.110,
                          width: width * 0.52,
                          // color: Colors.purple,
                          child: Text("$subject")),
                    )
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
