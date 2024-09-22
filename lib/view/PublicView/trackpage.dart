// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../Riverpod/Repository/complaintController.dart';
import 'historypage.dart';

class test extends ConsumerStatefulWidget {
  const test({super.key});

  @override
  ConsumerState<test> createState() => _testState();
}

class _testState extends ConsumerState<test> {
  createMap(p, s, h) {
    Map<String, double> dataMap = {"Pending": p, "Solved": s, "Hold": h};
    return dataMap;
  }

  List<Color> colorList = [Colors.red, Colors.green, Colors.blue];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final details = ref.watch(getownReportProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaint Status"),
      ),
      body: SingleChildScrollView(
        child: details.when(
          data: (data) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 30, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.black,
                      child: Text(
                        (data!.pendingComplaint +
                                data.holdComplaint +
                                data.solvedComplaint)
                            .toString(),
                        style: const TextStyle(color: Colors.white),
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
                  children: [
                    const Text(
                      "Pending",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.black,
                      child: Text(data.pendingComplaint.toString(),
                          style: const TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hold",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.black,
                      child: Text(data.holdComplaint.toString(),
                          style: const TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Solved",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.black,
                      child: Text(
                        data.solvedComplaint.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                // color: Colors.black,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                  height: height * 0.2,
                  child: PieChart(
                    dataMap: createMap(data.pendingComplaint.toDouble(),
                        data.holdComplaint.toDouble(), data.solvedComplaint.toDouble()),
                    colorList: colorList,
                    chartRadius: width / 2,
                  )),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                // color: Colors.black,
              ),
            ],
          ),
          error: (Object error, StackTrace? stackTrace) {
            return null;
          },
          loading: () {
            return null;
          },
        ),
      ),
    );
  }
}
