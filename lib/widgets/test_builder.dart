import 'package:flutter/material.dart';

class Testbuilder extends StatefulWidget {
  Testbuilder(
      {super.key,
      required this.name,
      required this.category,
      required this.description});
  String name;
  String category;
  String description;

  @override
  State<Testbuilder> createState() => _TestbuilderState();
}

class _TestbuilderState extends State<Testbuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text("Name: "),
            SizedBox(
              width: 56,
            ),
            Text(widget.name),
          ],
        ),
        Row(
          children: [
            Text("Category: "),
            SizedBox(
              width: 34,
            ),
            Text(widget.category),
          ],
        ),
        Row(
          children: [
            Text("Description: "),
            SizedBox(
              width: 17,
            ),
            Expanded(
              child: Text(
                widget.description,
              ),
            ),
          ],
        ),
        Divider(
          thickness: 2,
          color: Colors.black,
        )
      ],
    ));
  }
}
