import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/controller/riverpodmanager.dart';
import 'package:project/model/threemodel.dart';
import 'package:project/view/fullnews.dart';
import 'package:project/view/login.dart';
import 'package:project/widgets/listpmaker.dart';

class Publicmaker extends ConsumerWidget {
  const Publicmaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(publicriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: height * 0.48,
        // color: Colors.red,
        child: Column(children: [
          Text("Public Complaints",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          Container(
              height: height * 0.37,
              // color: Colors.green,
              child: Column(
                children: [
                  Listpmaker(
                    model: watch.publiccomplaint[0],
                  ),
                  Listpmaker(
                    model: watch.publiccomplaint[1],
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: InkWell(
                onTap: () {},
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
