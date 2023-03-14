import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/Riverpod/Repository/complaintController.dart';
import 'package:project/view/PublicView/Complaints/editComplaints.dart';
import 'package:project/view/PublicView/mycomplaintspage.dart/complaintspage.dart';
import 'package:readmore/readmore.dart';

import '../appbar.dart';

class PendingComplaints extends ConsumerStatefulWidget {
  const PendingComplaints({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PendingComplaintsState();
}

class _PendingComplaintsState extends ConsumerState<PendingComplaints> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final details = ref.watch(getallComplaintProvider);
    return details.when(
      data: (data) => ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 2.0, right: 2.0, top: 0.0, bottom: 6),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey.shade200),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 13, right: 4, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  Text(
                                    data[index].complaintMiti,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  const Text(
                                    "11:12pm",
                                  )
                                ],
                              )),
                              //add a option menu but the menu should pop from bottom
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        context: context,
                                        builder: (context) {
                                          return Wrap(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.02,
                                                    vertical: height * 0.02),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () async {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ComplaintUpdatePage(
                                                                            cm: data[index],
                                                                          )));
                                                        },
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.edit,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.04,
                                                            ),
                                                            const Text(
                                                              "Edit",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                    TextButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title:
                                                                    const Text(
                                                                  "Are you sure you want to delete?",
                                                                  // style: getsubtitleSize(context).copyWith(fontFamily: "Regular"),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            "No"),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Future<dynamic>
                                                                          code =
                                                                          ref.watch(complaintProvider).deleteComplaint(data[index]
                                                                              .id
                                                                              .toString());
                                                                      code.then(
                                                                        (value) {
                                                                          if (value ==
                                                                              200) {
                                                                            Navigator.pop(context);
                                                                            Navigator.pop(context);
                                                                            ref.refresh(getallComplaintProvider);

                                                                            Navigator.pushReplacement(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                    builder: (context) => Appbar(
                                                                                          cindex: 1,
                                                                                        )));
                                                                          }
                                                                        },
                                                                      );
                                                                    },
                                                                    child: const Text(
                                                                        "Yes"),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.04,
                                                            ),
                                                            const Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: Colors.black,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          data[index].complaintTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        ReadMoreText(
                          data[index].complaintDescription,
                          trimLines: 3,
                          colorClickableText: Colors.blue,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: '...show less',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            data[index].imageBytes == null
                                ? Container(
                                    height: height * 0.15,
                                    width: width * 0.5,
                                    color: Colors.grey,
                                    child: Center(
                                      child: const Text(
                                        "No Image",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Center(
                                            child: Wrap(
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: height * 0.15,
                                                    width: width * 0.5,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: MemoryImage(
                                                                base64Decode(data[
                                                                        index]
                                                                    .imageBytes
                                                                    .toString())),
                                                            fit: BoxFit
                                                                .fitWidth)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: height * 0.15,
                                      width: width * 0.5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: MemoryImage(base64Decode(
                                                  data[index]
                                                      .imageBytes
                                                      .toString())),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                            SizedBox(width: width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                makeTwoline(
                                    "Status:",
                                    data[index].complaintStatus == 0
                                        ? "Pending"
                                        : data[index].complaintStatus == 1
                                            ? "Hold"
                                            : "Solved",
                                    context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline(
                                    "Location:", data[index].location, context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline("Ward No:",
                                    data[index].wardNo.toString(), context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline(
                                    "Priority:",
                                    data[index].priority == 0
                                        ? "Critical"
                                        : data[index].priority == 1
                                            ? "Moderate"
                                            : "Low",
                                    context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline(
                                    "Category:",
                                    data[index].category == 0
                                        ? "Water"
                                        : data[index].category == 1
                                            ? "Road"
                                            : data[index].category == 2
                                                ? "Health"
                                                : data[index].category == 3
                                                    ? "Electricity"
                                                    : "Education",
                                    context)
                              ],
                            )
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
        return const Center(
          child: Text("Something went wrong"),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

makeTwoline(String first, String second, BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Row(
    children: [
      Text(
        first,
        style: const TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      SizedBox(width: width * 0.01),
      SizedBox(
        width: 100,
        child: Text(
          second,
          style: const TextStyle(fontSize: 15
              // fontWeight: FontWeight.bold,
              ),
        ),
      ),
    ],
  );
}
