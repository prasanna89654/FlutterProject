// ignore_for_file: sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/Riverpod/Repository/complaintController.dart';
import 'package:project/controller/riverpodmanager.dart';
import 'package:project/view/PublicView/publicComplaints.dart';
import 'package:project/widgets/listpmaker.dart';
import 'package:readmore/readmore.dart';

import '../view/PublicView/mycomplaintspage.dart/pendingpage.dart';
import 'full_public.dart';

class Publicmaker extends ConsumerWidget {
  const Publicmaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(publicriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final details = ref.watch(getallComplaintProvider);
    return details.when(
      data: (data) => Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
        child: Container(
          // height: height * 0.48,
          child: Column(children: [
            Row(
              children: [
                const Text("  Public Complaints",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PublicComplaints()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 7),
                      child: const Text("View More",
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
            ListView.builder(
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
                              top: 10.0, left: 13, right: 4, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: width * 0.04,
                                            backgroundImage: AssetImage(
                                                "assets/images/user.png"),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            data[index].username,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 17,
                                                color: Colors.black),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            data[index].complaintMiti,
                                          )
                                        ],
                                      )),
                                    ]),
                              ),
                              //add a option menu but the menu should pop from bottom

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
                                style: TextStyle(
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
                                          width: width * 0.4,
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
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          height: height * 0.8,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: MemoryImage(base64Decode(data[
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
                                            width: width * 0.4,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: MemoryImage(
                                                        base64Decode(data[index]
                                                            .imageBytes
                                                            .toString())),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                  SizedBox(width: width * 0.02),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      makeTwoline("Location:",
                                          data[index].location, context),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      makeTwoline(
                                          "Ward No:",
                                          data[index].wardNo.toString(),
                                          context),
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
                                                      : data[index].category ==
                                                              3
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
            )
          ]),
        ),
      ),
      error: (Object error, StackTrace? stackTrace) {
        return const Center(child: Text('Something went wrong!'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
