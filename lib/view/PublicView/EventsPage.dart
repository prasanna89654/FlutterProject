import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/Riverpod/Repository/EventController.dart';
import 'package:readmore/readmore.dart';

import 'mycomplaintspage.dart/pendingpage.dart';

class EventsPage extends ConsumerStatefulWidget {
  const EventsPage({super.key});

  @override
  ConsumerState<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends ConsumerState<EventsPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final details = ref.watch(getalleventsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      body: details.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
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
                                          image: MemoryImage(base64Decode(
                                              data[index]
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
                              makeTwoline(
                                  "Location:", data[index].location, context),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              makeTwoline(
                                  "Date:", data[index].eventMiti, context),
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
        },
      ),
    );
  }
}
