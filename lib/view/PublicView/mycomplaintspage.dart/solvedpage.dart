import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/Riverpod/Repository/complaintController.dart';
import 'package:project/view/PublicView/mycomplaintspage.dart/pendingpage.dart';
import 'package:readmore/readmore.dart';

import '../../../Riverpod/Models/userModel.dart';
import '../../../widgets/TEsts/random.dart';

class SolvedComplaints extends ConsumerStatefulWidget {
  const SolvedComplaints({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SolvedComplaintsState();
}

class _SolvedComplaintsState extends ConsumerState<SolvedComplaints> {
  List<ComplaintGetAllModel> datas = [];

  initdata() async {
    final data = await ref.read(complaintProvider).getownComplaints();
    final dad = data.where((element) => element.status == 'solved').toList();
    setState(() {
      datas = dad;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // final details = ref.watch(getownComplaintProvider);

    return datas.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: datas.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 2.0, right: 2.0, top: 0.0, bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RandomPage(
                                  choosedlat: firstString(datas[index].address),
                                  choosedlong: lastString(datas[index].address),
                                )));
                  },
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
                                Text(
                                  datas[index].created_at,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            datas[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          ReadMoreText(
                            datas[index].description,
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
                              datas[index].image == null
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
                                                      height: height * 0.15,
                                                      width: width * 0.5,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: MemoryImage(
                                                                  base64Decode(datas[
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
                                            width: width * 0.5,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: MemoryImage(
                                                        base64Decode(
                                                            datas[index]
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
                                      "Status:", datas[index].status, context),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  makeTwoline("Ward No:",
                                      datas[index].ward.toString(), context),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  makeTwoline("Priority:",
                                      datas[index].priority, context),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  makeTwoline("Category:",
                                      datas[index].category, context)
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
  }
}

// makeTwoline(String first, String second, BuildContext context) {
//   var height = MediaQuery.of(context).size.height;
//   final width = MediaQuery.of(context).size.width;
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(
//         first,
//         style: const TextStyle(
//             fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
//       ),
//       SizedBox(width: width * 0.01),
//       SizedBox(
//         width: 100,
//         child: Text(
//           second,
//           style: const TextStyle(fontSize: 15
//               // fontWeight: FontWeight.bold,
//               ),
//         ),
//       ),
//     ],
//   );
// }
