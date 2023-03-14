// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MaintainerStatus extends StatefulWidget {
  const MaintainerStatus({Key? key}) : super(key: key);

  @override
  State<MaintainerStatus> createState() => _testState();
}

class _testState extends State<MaintainerStatus> {
  Map<String, double> dataMap = {"Pending": 5, "Solved": 7, "Hold": 4};

  List<Color> colorList = [Colors.red, Colors.green, Colors.blue];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaint Status"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 30, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black,
                    child: Text(
                      "16",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Pending",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black,
                    child: Text("5", style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Hold",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black,
                    child: Text("4", style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Solved",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black,
                    child: Text(
                      "7",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              // color: Colors.black,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: height * 0.2,
                child: PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: width / 2,
                )),
            const SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 1,
              // color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
