// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/widgets/newscontainer.dart';
import 'package:shimmer/shimmer.dart';

import '../controller/newsprovider.dart';
// import 'listnewsmaker.dart';

class Newsmaker extends ConsumerWidget {
  const Newsmaker({Key? key, this.changePage}) : super(key: key);
  final void Function(int)? changePage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var watch = ref.watch(newsriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
      child: Container(
        height: height * 0.55,
        child: Column(children: [
          const Text("Latest News",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          Container(
              height: height * 0.44,
              // color: Colors.green,
              child: Column(children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 10, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.1952,
                          width: width * 0.31,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              height: height * 0.039,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: height * 0.145,
                              color: Colors.white,
                            ),
                            Container()
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8, top: 10, bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: height * 0.1952,
                          width: width * 0.31,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: double.infinity,
                              height: height * 0.039,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              height: height * 0.145,
                              color: Colors.white,
                            ),
                            Container()
                          ],
                        ))
                      ],
                    ),
                  ),
                )
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: InkWell(
                onTap: () => changePage!(2),
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
