// ignore_for_file: sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/Riverpod/Repository/complaintController.dart';
import 'package:project/controller/riverpodmanager.dart';
import 'package:project/view/PublicView/publicComplaints.dart';
import 'package:readmore/readmore.dart';

import '../Riverpod/Models/userModel.dart';
import '../view/PublicView/mycomplaintspage.dart/pendingpage.dart';

class Publicmaker extends ConsumerStatefulWidget {
  const Publicmaker({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PublicmakerState();
}

class _PublicmakerState extends ConsumerState<Publicmaker> {
  List<ComplaintGetAllModel> fatas = [];
  getinitfatas() {
    getComplaints().then((value) {
      setState(() {
        fatas = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getinitfatas();
  }

  @override
  Widget build(BuildContext context) {
    var watch = ref.watch(publicriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final details = ref.watch(getallComplaintProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
      child: Container(
        // height: height * 0.48,
        child: Column(children: [
          Row(
            children: [
              const Text("  Public Complaints",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              const Spacer(),
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
          ListView.builder(
            itemCount: fatas.length > 2 ? 2 : fatas.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: width * 0.04,
                                      backgroundImage: const AssetImage(
                                          "assets/images/user.png"),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      fatas[index].username!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      fatas[index].created_at.substring(0, 10),
                                    )
                                  ],
                                ),
                              ]),
                        ),
                        //add a option menu but the menu should pop from bottom

                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          fatas[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        ReadMoreText(
                          fatas[index].description,
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
                            fatas[index].image == null
                                ? const SizedBox()
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
                                                    height: height * 0.8,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: MemoryImage(
                                                                base64Decode(fatas[
                                                                        index]
                                                                    .image
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
                                    child: Row(
                                      children: [
                                        Container(
                                          height: height * 0.15,
                                          width: width * 0.4,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      base64Decode(fatas[index]
                                                          .image
                                                          .toString())),
                                                  fit: BoxFit.cover)),
                                        ),
                                        SizedBox(width: width * 0.02),
                                      ],
                                    ),
                                  ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                makeTwoline(
                                    "Status:", fatas[index].status, context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline("Ward No:",
                                    fatas[index].ward.toString(), context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline("Priority:", fatas[index].priority,
                                    context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline(
                                    "Category:", fatas[index].category, context)
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
