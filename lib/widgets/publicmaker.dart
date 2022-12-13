// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/controller/riverpodmanager.dart';
import 'package:project/widgets/listpmaker.dart';

import 'full_public.dart';

class Publicmaker extends ConsumerWidget {
  const Publicmaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(publicriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
      child: Container(
        height: height * 0.55,
        // color: Colors.red,
        child: Column(children: [
          const Text("Public Complaints",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          Container(
              height: height * 0.42,
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
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Fullpublic(),
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
