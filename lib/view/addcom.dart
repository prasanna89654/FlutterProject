import 'dart:ui';

import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        child: Text("Choose Category  "), value: "Choose Category  "),
    DropdownMenuItem(child: Text("Road"), value: "Road"),
    DropdownMenuItem(child: Text("Electricity"), value: "Electricity"),
    DropdownMenuItem(child: Text("Hospital"), value: "Hospital"),
    DropdownMenuItem(child: Text("Public places"), value: "Public places"),
    DropdownMenuItem(child: Text("Ward"), value: "Ward"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get prioritydropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Priority  "), value: "Priority  "),
    DropdownMenuItem(child: Text("Low"), value: "Low"),
    DropdownMenuItem(child: Text("Medium"), value: "Medium"),
    DropdownMenuItem(child: Text("High"), value: "High"),
  ];
  return menuItems;
}

class addCom extends StatefulWidget {
  const addCom({Key? key}) : super(key: key);

  @override
  State<addCom> createState() => _addComState();
}

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
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Builder(builder: (context) {
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
                          child: CircleAvatar(
                            child: Icon(Icons.close),
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ),
                      Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: "Subject"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: "Location"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: "Image"),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
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
                                  child: Text("Submit"), onPressed: () {}),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            })));
  }
}
