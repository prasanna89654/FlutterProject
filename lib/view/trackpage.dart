// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import 'historypage.dart';

class test extends StatefulWidget {
  const test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  Map<String, double> dataMap = {"Pending": 5, "Solved": 8};

  List<Color> colorList = [Colors.red, Colors.green];

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
                    backgroundColor: Color.fromARGB(255, 97, 77, 77),
                    child: Text("15"),
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
                    backgroundColor: Color.fromARGB(255, 97, 77, 77),
                    child: Text("15"),
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
                    backgroundColor: Color.fromARGB(255, 97, 77, 77),
                    child: Text("15"),
                  )
                ],
              ),
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
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HistoryPage(),
                    ));
              },
              child: Container(
                margin: const EdgeInsets.all(8),
                height: height * 0.04,
                padding: const EdgeInsets.only(left: 8, right: 8, top: 3),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 180, 171, 171),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 2, color: Colors.grey),
                ),
                child: const Text(
                  "View your Complaint History",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
