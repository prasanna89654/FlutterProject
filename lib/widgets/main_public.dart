// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Fullpublic extends StatefulWidget {
  const Fullpublic({super.key});

  @override
  State<Fullpublic> createState() => _FullpublicState();
}

class _FullpublicState extends State<Fullpublic> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Public Complaints'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 2.0, right: 2.0, top: 10.0, bottom: 12),
          child: Card(
            color: const Color.fromARGB(255, 199, 197, 197),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
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
                        children: const [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Prasanna Poudel",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )),
                      Column(
                        children: [
                          const Text(
                            "Sunday",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            DateFormat.Hm().format(DateTime.now()),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
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
        ),
      ),
    );
  }
}
