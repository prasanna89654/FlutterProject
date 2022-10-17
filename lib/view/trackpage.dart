// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: height * 0.2,
                child: PieChart(
                  dataMap: dataMap,
                  colorList: colorList,
                  chartRadius: width / 2,
                ))
          ],
        ),
      ),
    );
  }
}
