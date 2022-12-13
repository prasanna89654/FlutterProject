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
    return Scaffold(
        appBar: AppBar(
          title: const Text("Complaint History"),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.only(bottom: 120),
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const Flexible(
                    fit: FlexFit.tight,
                    child: HistoryMaker(),
                  );
                },
              )),
        ));
  }
}
