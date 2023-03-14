// ignore_for_file: sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/controller/riverpodmanager.dart';
import 'package:project/view/PublicView/EventsPage.dart';
import 'package:readmore/readmore.dart';

import '../Riverpod/Repository/EventController.dart';
import '../view/PublicView/mycomplaintspage.dart/pendingpage.dart';
import 'listnearbymaker.dart';

class Nearbymaker extends ConsumerWidget {
  const Nearbymaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(nearbyriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final details = ref.watch(getalleventsProvider);

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Text("  Nearby Events",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EventsPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(40)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    child: Text("View More",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          details.when(
              data: (data) => ListView.builder(
                    itemCount: data.length > 2 ? 2 : data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Flexible(
                          fit: FlexFit.tight,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 2.0, right: 2.0, top: 4.0, bottom: 6),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                  color: Colors.grey.shade200),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 13, right: 13, bottom: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    data[index].imageBytes == null
                                        ? Container(
                                            height: height * 0.2,
                                            width: width,
                                            color: Colors.grey,
                                            child: Center(
                                              child: const Text(
                                                "No Image",
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            height: height * 0.2,
                                            width: width,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: MemoryImage(
                                                        base64Decode(data[index]
                                                            .imageBytes
                                                            .toString())),
                                                    fit: BoxFit.cover)),
                                          ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Text(
                                        data[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    ReadMoreText(
                                      data[index].shortDescription,
                                      trimLines: 3,
                                      colorClickableText: Colors.blue,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: 'Read more',
                                      trimExpandedText: '...show less',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.015,
                                    ),
                                    Column(
                                      children: [
                                        makeTwoline("Location:",
                                            data[index].location, context),
                                        SizedBox(
                                          height: height * 0.01,
                                        ),
                                        makeTwoline("Date:",
                                            data[index].eventMiti, context),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ));
                    },
                  ),
              error: (Object error, StackTrace? stackTrace) {
                return Center(
                  child: Text(error.toString()),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              })
        ]),
      ),
    );
  }
}
