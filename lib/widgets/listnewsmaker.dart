import 'package:flutter/material.dart';

import '../model/threemodel.dart';
import '../view/webview.dart';

class Listnewsmaker extends StatelessWidget {
  String image;
  String? title;

  String? subject;
  DateTime? date;

  String? link;
  Listnewsmaker({
    Key? key,
    required this.image,
    this.title,
    this.date,
    this.subject,
    this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebviewScreen(url: link)));
        },
        child: Container(
          height: height * 0.24,
          // color: Colors.blue,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            shadowColor: Colors.black,
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                  child: Container(
                    height: height * 0.04,
                    // color: Colors.red,
                    width: width,

                    child: Text(
                      title!,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 5, bottom: 4),
                        child: Container(
                            height: height * 0.156,
                            width: width * 0.32,
                            // color: Colors.purple,
                            child: Image.asset(
                              image,
                              fit: BoxFit.contain,
                            )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: height * 0.156,
                            width: width * 0.55,
                            // color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        height: height * 0.016,
                                        width: width * 0.24,
                                        // color: Colors.green,
                                        child: Text(
                                          "$date",
                                        )),
                                  ],
                                ),
                                Container(
                                    height: height * 0.13,
                                    width: width * 0.55,
                                    // color: Colors.purple,
                                    child: Text(subject!,
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 18,
                                        )))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
