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
                    child: Container(height: 300, color: Colors.blue),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(height: 300, color: Colors.green),
                    flex: 1,
                  ),
                  Container(
                    height: 300,
                    width: 200,
                    color: Colors.red,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(height: 300, color: Colors.blue),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(height: 300, color: Colors.green),
                    flex: 1,
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
