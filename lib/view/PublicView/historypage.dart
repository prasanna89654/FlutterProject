// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:project/widgets/historymaker.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          color: Colors.grey.shade200,
          padding: const EdgeInsets.only(bottom: 120),
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 10.0, bottom: 12),
                    child: Card(
                      elevation: 10,
                      // color: Color.fromARGB(255, 232, 235, 248),
                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(15.0),
                      // ),
                      // color: Colors.red,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    Text(
                                      "Today",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      "11:12pm",
                                    )
                                  ],
                                )),
                                //add a option menu but the menu should pop from bottom
                                const Icon(
                                  Icons.more_vert,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(13.0),
                            child: Expanded(
                                child: Text(
                              "Hello jsdnjnda dadndaid dadnaodiod didadiodbd dadadaidbaidba adbadbi dhbhd dnndn dnjandand anddadnaaaaaaaaaaaaaaaaaa",
                              maxLines: 10,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            )),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              height: height * 0.214,
                              width: width,
                              child: const Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/bilu.png",
                                ),
                              ))
                        ],
                      ),
                    ),
                  ));
            },
          )),
    ));
  }
}
