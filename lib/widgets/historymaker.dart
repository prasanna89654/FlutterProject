// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryMaker extends StatefulWidget {
  const HistoryMaker({super.key});

  @override
  State<HistoryMaker> createState() => _HistoryMakerState();
}

class _HistoryMakerState extends State<HistoryMaker> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          const EdgeInsets.only(left: 2.0, right: 2.0, top: 10.0, bottom: 12),
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
                  const Expanded(
                      child: Text(
                    "Sunday",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )),
                  Text(
                    DateFormat.Hm().format(DateTime.now()),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
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
    );
  }
}
