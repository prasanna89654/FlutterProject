// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/controller/riverpodmanager.dart';
import 'package:project/view/login.dart';

import 'listnearbymaker.dart';

class Nearbymaker extends ConsumerWidget {
  const Nearbymaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(nearbyriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
      child: Container(
        height: height * 0.55,
        // color: Colors.red,
        child: Column(children: [
          const Text("Nearby Events",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          Container(
              height: height * 0.42,
              // color: Colors.green,
              child: Column(
                children: [
                  Listnearbymaker(
                    model: watch.nearby[0],
                  ),
                  Listnearbymaker(
                    model: watch.nearby[1],
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Text("View More --->",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
