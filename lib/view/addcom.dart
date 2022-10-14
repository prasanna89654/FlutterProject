import 'dart:ui';

import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
        value: "Choose Category  ", child: Text("Choose Category  ")),
    const DropdownMenuItem(value: "Road", child: Text("Road")),
    const DropdownMenuItem(value: "Electricity", child: Text("Electricity")),
    const DropdownMenuItem(value: "Hospital", child: Text("Hospital")),
    const DropdownMenuItem(
        value: "Public places", child: Text("Public places")),
    const DropdownMenuItem(value: "Ward", child: Text("Ward")),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get prioritydropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Priority  ", child: Text("Priority  ")),
    const DropdownMenuItem(value: "Low", child: Text("Low")),
    const DropdownMenuItem(value: "Medium", child: Text("Medium")),
    const DropdownMenuItem(value: "High", child: Text("High")),
  ];
  return menuItems;
}

// ignore: camel_case_types
class addCom extends StatefulWidget {
  const addCom({Key? key}) : super(key: key);

  @override
  State<addCom> createState() => _addComState();
}

// ignore: camel_case_types
class _addComState extends State<addCom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    String selectedValue = "Choose Category  ";
    String priorityValue = "Priority  ";
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
            insetPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Builder(builder: (context) {
              // ignore: sized_box_for_whitespace
              return Container(
                  height: height - 200,
                  width: width - 80,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        right: -40.0,
                        top: -40.0,
                        child: InkResponse(
                          onTap: () {},
                          child: const CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(Icons.close),
                          ),
                        ),
                      ),
                      Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: "Subject"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: "Location"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: "Image"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: "Description"),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: DropdownButton<String>(
                                      value: selectedValue,
                                      items: dropdownItems,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedValue = newValue!;
                                        });
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: DropdownButton<String>(
                                      value: priorityValue,
                                      items: prioritydropdownItems,
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          priorityValue = newValue!;
                                        });
                                      }),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  child: const Text("Submit"),
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            })));
  }
}
