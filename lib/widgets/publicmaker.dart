import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/model/threemodel.dart';

class Publicmaker extends ConsumerWidget {
  const Publicmaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        height: height * 0.38,
        color: Colors.red,
        child: Column(children: [
          Text("Public Complaints",
              style: TextStyle(
                fontSize: 20,
              )),
          Container(
            height: height * 0.3,
            color: Colors.green,
          )
        ]),
      ),
    );
  }
}
