import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 80, right: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(height: 300, color: Colors.blue),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(height: 300, color: Colors.green),
                  ),
                  Container(
                    height: 300,
                    width: 200,
                    color: Colors.red,
                  )
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(height: 300, color: Colors.blue),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(height: 300, color: Colors.green),
                  ),
                  Container(
                    height: 300,
                    width: 200,
                    color: Colors.red,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
