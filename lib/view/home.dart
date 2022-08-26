import 'package:flutter/material.dart';
import 'package:project/widgets/crousal.dart';

import '../widgets/sidebar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Crousal(),
          SizedBox(
            height: 10,
          ),
          Container(
              height: height * 0.15,
              // color: Colors.red,
              child: Stack(children: [
                Container(
                  height: height * 0.29,
                  width: width,
                  decoration: new BoxDecoration(
                    // color: Colors.green,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(width, 10.0),
                        bottom: Radius.elliptical(width, 120.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height * 0.120,
                            width: width * 0.30,
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: height * 0.09,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple,
                                    ),
                                    child: IconButton(
                                      onPressed: (() {}),
                                      icon: Icon(Icons.track_changes),
                                    )),
                                Text("Track Complain")
                              ],
                            )),
                        Container(
                            height: height * 0.120,
                            width: width * 0.30,
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: height * 0.09,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple,
                                    ),
                                    child: IconButton(
                                      onPressed: (() {}),
                                      icon: Icon(Icons.add),
                                    )),
                                Text("Add Complain")
                              ],
                            )),
                        Container(
                            height: height * 0.120,
                            width: width * 0.30,
                            // color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: height * 0.09,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.purple,
                                    ),
                                    child: IconButton(
                                      onPressed: (() {}),
                                      icon: Icon(Icons.phone),
                                    )),
                                Text("Helplines")
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 18, right: 18),
            child: Container(
              height: height * 0.204,
              // color: Colors.blue,
              child: Card(
                  margin: EdgeInsets.all(3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 20,
                  color: Colors.grey,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 30, right: 30),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Complaint",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: height * 0.098,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Pending",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Center(
                                    child: Container(
                                      height: height * 0.045,
                                      width: width * 0.20,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.blue,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "9",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                height: height * 0.10,
                                // color: Colors.red,
                                child: VerticalDivider(
                                  thickness: 2,
                                  color: Colors.black26,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: height * 0.098,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "Solved",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                      child: Container(
                                        height: height * 0.045,
                                        width: width * 0.20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "9",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                height: height * 0.10,
                                // color: Colors.red,
                                child: VerticalDivider(
                                  thickness: 2,
                                  color: Colors.black26,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: height * 0.098,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Total",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Center(
                                      child: Container(
                                        height: height * 0.048,
                                        width: width * 0.20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "9",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}
