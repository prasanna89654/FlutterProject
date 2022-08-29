import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/controller/riverpodmanager.dart';
import 'package:project/model/threemodel.dart';
import 'package:project/view/login.dart';
import 'package:project/widgets/listpmaker.dart';

import 'listnearbymaker.dart';

class Nearbymaker extends ConsumerWidget {
  const Nearbymaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(nearbyriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
      child: Container(
        height: height * 0.55,
        // color: Colors.red,
        child: Column(children: [
          Text("Nearby Events",
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
                        builder: (context) => LoginScreen(),
                      ));
                },
                child: Text("View More --->",
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
