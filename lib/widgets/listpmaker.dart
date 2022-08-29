import 'package:flutter/material.dart';

import '../model/threemodel.dart';

class Listpmaker extends StatelessWidget {
  Threemodel model;
  Listpmaker({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var name = model.name;
    var date = model.date;
    var subject = model.subject;
    var image = model.image;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: height * 0.19,
        // color: Colors.blue,
        child: Expanded(
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 3, color: Color.fromARGB(255, 245, 242, 251)),
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.03,
                        width: width * 0.359,
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("$name"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Text(
                          "$date",
                          maxLines: 1,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 4),
                      child: Container(
                          height: height * 0.125,
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
                          height: height * 0.125,
                          width: width * 0.52,
                          // color: Colors.purple,
                          child: Text(
                            "$subject",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          )),
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
