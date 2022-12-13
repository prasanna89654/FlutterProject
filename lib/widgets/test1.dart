// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:project/widgets/practice.dart';
import 'package:project/widgets/test_builder.dart';

class Testpage extends StatefulWidget {
  const Testpage({
    super.key,
  });

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
                padding: const EdgeInsets.all(8),
                child: FutureBuilder(
                    future: getData(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              var data = snapshot.data;
                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Container(
                                  height: 120,
                                  child: Testbuilder(
                                      name: data[index].apiname,
                                      category: data[index].category,
                                      description: data[index].description),
                                ),
                              );
                            });
                      }
                      return Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Container(
                            height: 300,
                            child: Center(child: CircularProgressIndicator()),
                          ));
                    }))));
  }
}
