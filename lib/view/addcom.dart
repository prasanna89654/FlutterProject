// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/boxdecoration.dart';

var categoryItems = [
  "Road",
  "Electricity",
  "Hospital",
  "Public places",
  "Ward"
];

var priorityItems = ["Low", "Medium", "High"];

// ignore: camel_case_types
class addCom extends StatefulWidget {
  const addCom({Key? key}) : super(key: key);

  @override
  State<addCom> createState() => _addComState();
}

String selectedValue = "Road";
String priorityValue = "Low";

String dropdownvalue = 'Ward no. 1';

var items = [
  'Ward no. 1',
  'Ward no. 2',
  'Ward no. 3',
  'Ward no. 4',
  'Ward no. 5',
  'Ward no. 6',
  'Ward no. 7',
  'Ward no. 8',
];

final _formKey = GlobalKey<FormState>();

// ignore: camel_case_types
class _addComState extends State<addCom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Stack(children: [
      SingleChildScrollView(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: AlertDialog(
                insetPadding: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                content: Builder(builder: (context) {
                  return Container(
                      height: height - 240,
                      width: width - 60,
                      child: Stack(
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 8.0,
                                      right: 8.0,
                                      top: 6.0,
                                      bottom: 8.0),
                                  child: Text(
                                    "Fill your Complaints here.",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0,
                                      right: 8.0,
                                      top: 14.0,
                                      bottom: 8.0),
                                  child: TextFormField(
                                    decoration: textDecoration.copyWith(
                                      labelText: "Subject",
                                      prefixIcon: const Icon(Icons.subject),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: textDecoration.copyWith(
                                      labelText: "Location",
                                      prefixIcon: const Icon(Icons.location_on),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8,
                                          right: 8,
                                          top: 12,
                                          bottom: 10),
                                      child: Container(
                                        height: height * 0.06,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(18),
                                            border: Border.all(
                                              color: Colors.blue,
                                            )),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            children: const [
                                              Icon(Icons.camera_enhance),
                                              SizedBox(
                                                width: 7,
                                              ),
                                              Text("Add a photo/video"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          border: Border.all(
                                            color: Colors.blue,
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(

                                              // Initial Value
                                              value: dropdownvalue,
                                              // borderRadius: BorderRadius.circular(0),

                                              // Down Arrow Icon
                                              icon: const Icon(
                                                  Icons.keyboard_arrow_down),

                                              // Array list of items
                                              items: items.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              // After selecting the desired option,it will
                                              // change button value to selected value
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  dropdownvalue = newValue!;
                                                });
                                              }),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Description",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      TextFormField(
                                          cursorHeight: 30,
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 4,

                                          // minLines: 2,
                                          decoration: textDecoration),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: Container(
                                        height: height * 0.04,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Choose Category :",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                  value: selectedValue,
                                                  items: categoryItems
                                                      .map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(items),
                                                    );
                                                  }).toList(),
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      selectedValue = newValue!;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(9.0),
                                      child: Container(
                                        height: height * 0.04,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              "Priority :",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                  value: priorityValue,
                                                  items: priorityItems
                                                      .map((String items) {
                                                    return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(items),
                                                    );
                                                  }).toList(),
                                                  icon: const Icon(Icons
                                                      .keyboard_arrow_down),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      priorityValue = newValue!;
                                                    });
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 70,
                                    width: 170,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const StadiumBorder(),
                                            textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        child: const Text("Send"),
                                        onPressed: () {}),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                }))),
      ),
    ]);
  }
}
