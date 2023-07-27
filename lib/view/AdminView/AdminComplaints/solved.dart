// import 'dart:convert';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:http/http.dart' as http;
// import 'package:project/Riverpod/Models/userModel.dart';
// import 'package:project/Riverpod/Repository/complaintController.dart';
// import 'package:project/widgets/TEsts/random.dart';
// import 'package:project/widgets/test1.dart';

// import '../../../Riverpod/baseDIo.dart';
// import '../../../Riverpod/config.dart';
// import '../../../widgets/TEsts/getmap.dart';
// import '../../PublicView/mycomplaintspage.dart/pendingpage.dart';

// class AdminSolvedPage extends ConsumerStatefulWidget {
//   const AdminSolvedPage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _AdminSolvedPageState();
// }

// class _AdminSolvedPageState extends ConsumerState<AdminSolvedPage> {
//   bool issolved = false;
//   bool ishold = false;
//   int _selectedOption = 0;
//   int _selectedPriority = 0;

//   pendingnoti(String id) {
//     var data = {
//       "registration_ids": [registrationid],
//       "notification": {
//         "body": "Your Complaint at $id is set to Pending",
//         "title": "Hold",
//         "android_channel_id": "project",
//         "sound": false
//       }
//     };
//     var url = Uri.parse("https://fcm.googleapis.com/fcm/send");

//     var response = http.post(url, body: json.encode(data), headers: {
//       "Content-Type": "application/json",
//       "Authorization":
//           "key=AAAAT6UPTPw:APA91bGik0yWQnYEzR6wb8qU0EM28dJeHypX_JkrFOVUyZ1h8OkoLraz6owJW7DF3cj6PNXQWDCf9uaFQO-kwLeZ_cXbJsUjc5-QxKbydYMKH-0Ukk-SYc6HB8ED_Qj5oYcHEz4YRXtF"
//     });
//   }

//   holdnoti(String id) {
//     var data = {
//       "registration_ids": [registrationid],
//       "notification": {
//         "body": "Your Complaint at $id is on Hold",
//         "title": "Solved",
//         "android_channel_id": "project",
//         "sound": false
//       }
//     };
//     var url = Uri.parse("https://fcm.googleapis.com/fcm/send");

//     var response = http.post(url, body: json.encode(data), headers: {
//       "Content-Type": "application/json",
//       "Authorization":
//           "key=AAAAT6UPTPw:APA91bGik0yWQnYEzR6wb8qU0EM28dJeHypX_JkrFOVUyZ1h8OkoLraz6owJW7DF3cj6PNXQWDCf9uaFQO-kwLeZ_cXbJsUjc5-QxKbydYMKH-0Ukk-SYc6HB8ED_Qj5oYcHEz4YRXtF"
//     });
//   }

//   List<ComplaintGetAllModel> pdata = [];

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     // final details = ref.watch(getallComplaintProvider);
//     ref.watch(getallComplaintProvider).when(
//           data: (data) {
//             final dad =
//                 data.where((element) => element.complaintStatus == 2).toList();
//             setState(() {
//               pdata = dad;
//             });
//           },
//           error: (error, stackTrace) {},
//           loading: () {},
//         );
//     return ListView.builder(
//       itemCount: pdata.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding:
//               const EdgeInsets.only(left: 2.0, right: 2.0, top: 4.0, bottom: 6),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => RandomPage(
//                             choosedlat: firstString(pdata[index].location),
//                             choosedlong: lastString(pdata[index].location),
//                           )));
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(0),
//                   color: Colors.grey.shade200),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: 10.0, left: 13, right: 4, bottom: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(0.0),
//                       child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                                 child: Row(
//                               children: [
//                                 CircleAvatar(
//                                   backgroundColor: Colors.white,
//                                   radius: width * 0.04,
//                                   backgroundImage: const AssetImage(
//                                       "assets/images/user.png"),
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 Text(
//                                   pdata[index].username!,
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w500,
//                                       fontSize: 17,
//                                       color: Colors.black),
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.02,
//                                 ),
//                                 Text(
//                                   pdata[index].complaintMiti,
//                                 ),
//                                 Spacer(),
//                                 //add a option menu but the menu should pop from bottom
//                                 Row(
//                                   children: [
//                                     Chip(
//                                         backgroundColor:
//                                             pdata[index].priority == 0
//                                                 ? Colors.green
//                                                 : pdata[index].priority == 1
//                                                     ? Colors.orange
//                                                     : Colors.red,
//                                         label: Text(
//                                           pdata[index].priority == 0
//                                               ? "Low"
//                                               : pdata[index].priority == 1
//                                                   ? "Medium"
//                                                   : "High",
//                                           style: TextStyle(color: Colors.white),
//                                         )),
//                                     IconButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             _selectedOption =
//                                                 pdata[index].complaintStatus;
//                                             _selectedPriority =
//                                                 pdata[index].priority;
//                                           });
//                                           showModalBottomSheet(
//                                               backgroundColor: Colors.white,
//                                               shape:
//                                                   const RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.only(
//                                                               topLeft: Radius
//                                                                   .circular(20),
//                                                               topRight:
//                                                                   Radius
//                                                                       .circular(
//                                                                           20))),
//                                               context: context,
//                                               builder: (context) {
//                                                 return Wrap(
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           EdgeInsets.symmetric(
//                                                               horizontal:
//                                                                   width * 0.03,
//                                                               vertical: height *
//                                                                   0.02),
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: [
//                                                           ListTile(
//                                                             dense: true,
//                                                             onTap: () {
//                                                               showDialog(
//                                                                 context:
//                                                                     context,
//                                                                 builder:
//                                                                     (BuildContext
//                                                                         context) {
//                                                                   return StatefulBuilder(
//                                                                     builder: (context,
//                                                                             setState) =>
//                                                                         AlertDialog(
//                                                                       title: Text(
//                                                                           "Choose an option"),
//                                                                       content:
//                                                                           Column(
//                                                                         mainAxisSize:
//                                                                             MainAxisSize.min,
//                                                                         children: [
//                                                                           ListTile(
//                                                                             dense:
//                                                                                 true,
//                                                                             title:
//                                                                                 Text(
//                                                                               "Low",
//                                                                               style: TextStyle(fontSize: 18),
//                                                                             ),
//                                                                             leading:
//                                                                                 Radio(
//                                                                               value: 0,
//                                                                               groupValue: _selectedPriority,
//                                                                               onChanged: (value) {
//                                                                                 setState(() {
//                                                                                   _selectedPriority = int.parse(value.toString());
//                                                                                 });
//                                                                               },
//                                                                             ),
//                                                                           ),
//                                                                           ListTile(
//                                                                             dense:
//                                                                                 true,
//                                                                             title:
//                                                                                 Text(
//                                                                               "Medium",
//                                                                               style: TextStyle(fontSize: 18),
//                                                                             ),
//                                                                             leading:
//                                                                                 Radio(
//                                                                               value: 1,
//                                                                               groupValue: _selectedPriority,
//                                                                               onChanged: (value) {
//                                                                                 setState(() {
//                                                                                   _selectedPriority = int.parse(value.toString());
//                                                                                 });
//                                                                               },
//                                                                             ),
//                                                                           ),
//                                                                           ListTile(
//                                                                             dense:
//                                                                                 true,
//                                                                             title:
//                                                                                 Text(
//                                                                               "High",
//                                                                               style: TextStyle(fontSize: 18),
//                                                                             ),
//                                                                             leading:
//                                                                                 Radio(
//                                                                               value: 2,
//                                                                               groupValue: _selectedPriority,
//                                                                               onChanged: (value) {
//                                                                                 setState(() {
//                                                                                   _selectedPriority = int.parse(value.toString());
//                                                                                 });
//                                                                               },
//                                                                             ),
//                                                                           ),
//                                                                           Center(
//                                                                             child:
//                                                                                 TextButton(
//                                                                               child: Chip(
//                                                                                 backgroundColor: Colors.blue,
//                                                                                 label: Padding(
//                                                                                   padding: const EdgeInsets.all(8.0),
//                                                                                   child: Text(
//                                                                                     "Done",
//                                                                                     style: TextStyle(color: Colors.white),
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               onPressed: () async {
//                                                                                 var datas = {
//                                                                                   "complaintTitle": "",
//                                                                                   "complaintDescription": "",
//                                                                                   "complaintStatus": pdata[index].complaintStatus,
//                                                                                   "location": "",
//                                                                                   "image": null,
//                                                                                   "wardNo": pdata[index].wardNo,
//                                                                                   "complaintDate": "2018-04-25T00:00:00",
//                                                                                   "complaintMiti": "",
//                                                                                   "priority": _selectedPriority,
//                                                                                   "category": pdata[index].category,
//                                                                                   "imageBytes": null,
//                                                                                   "id": pdata[index].id
//                                                                                 };

//                                                                                 try {
//                                                                                   var response = await Api().put(MyConfig.getstatusURL, data: datas);
//                                                                                   print("upload: ${response.statusCode}");
//                                                                                   if (response.statusCode == 200) {
//                                                                                     ref.refresh(getallComplaintProvider);
//                                                                                     Fluttertoast.showToast(msg: "Priority Changed");
//                                                                                     Navigator.pop(context);
//                                                                                     Navigator.pop(context);
//                                                                                   } else {}
//                                                                                 } catch (e) {
//                                                                                   print("Helloi: $e");
//                                                                                 }
//                                                                               },
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   );
//                                                                 },
//                                                               );
//                                                             },
//                                                             title: Text(
//                                                               "Change Priority",
//                                                               style: TextStyle(
//                                                                 fontSize: 18,
//                                                                 color:
//                                                                     Colors.blue,
//                                                               ),
//                                                             ),
//                                                           ),

//                                                           ListTile(
//                                                             dense: true,
//                                                             onTap: () {
//                                                               showDialog(
//                                                                 context:
//                                                                     context,
//                                                                 builder:
//                                                                     (BuildContext
//                                                                         context) {
//                                                                   return StatefulBuilder(
//                                                                     builder: (context,
//                                                                             setState) =>
//                                                                         AlertDialog(
//                                                                       title: Text(
//                                                                           "Choose an option"),
//                                                                       content:
//                                                                           Column(
//                                                                         mainAxisSize:
//                                                                             MainAxisSize.min,
//                                                                         children: [
//                                                                           ListTile(
//                                                                             dense:
//                                                                                 true,
//                                                                             title:
//                                                                                 Text(
//                                                                               "Pending",
//                                                                               style: TextStyle(fontSize: 18),
//                                                                             ),
//                                                                             leading:
//                                                                                 Radio(
//                                                                               value: 0,
//                                                                               groupValue: _selectedOption,
//                                                                               onChanged: (value) {
//                                                                                 setState(() {
//                                                                                   _selectedOption = int.parse(value.toString());
//                                                                                 });
//                                                                               },
//                                                                             ),
//                                                                           ),
//                                                                           ListTile(
//                                                                             dense:
//                                                                                 true,
//                                                                             title:
//                                                                                 Text(
//                                                                               "Hold",
//                                                                               style: TextStyle(fontSize: 18),
//                                                                             ),
//                                                                             leading:
//                                                                                 Radio(
//                                                                               value: 1,
//                                                                               groupValue: _selectedOption,
//                                                                               onChanged: (value) {
//                                                                                 setState(() {
//                                                                                   _selectedOption = int.parse(value.toString());
//                                                                                 });
//                                                                               },
//                                                                             ),
//                                                                           ),
//                                                                           Center(
//                                                                             child:
//                                                                                 TextButton(
//                                                                               child: Chip(
//                                                                                 backgroundColor: Colors.blue,
//                                                                                 label: Padding(
//                                                                                   padding: const EdgeInsets.all(8.0),
//                                                                                   child: Text(
//                                                                                     "Done",
//                                                                                     style: TextStyle(color: Colors.white),
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               onPressed: () async {
//                                                                                 var datas = {
//                                                                                   "complaintTitle": "",
//                                                                                   "complaintDescription": "",
//                                                                                   "complaintStatus": _selectedOption,
//                                                                                   "location": "",
//                                                                                   "image": null,
//                                                                                   "wardNo": pdata[index].wardNo,
//                                                                                   "complaintDate": "2018-04-25T00:00:00",
//                                                                                   "complaintMiti": "",
//                                                                                   "priority": pdata[index].priority,
//                                                                                   "category": pdata[index].category,
//                                                                                   "imageBytes": null,
//                                                                                   "id": pdata[index].id
//                                                                                 };

//                                                                                 try {
//                                                                                   var response = await Api().put(MyConfig.getstatusURL, data: datas);
//                                                                                   print("upload: ${response.statusCode}");
//                                                                                   if (response.statusCode == 200) {
//                                                                                     ref.refresh(getallComplaintProvider);
//                                                                                     Fluttertoast.showToast(msg: "Status Changed");
//                                                                                     Navigator.pop(context);
//                                                                                     Navigator.pop(context);
//                                                                                     _selectedOption == 0 ? pendingnoti(pdata[index].complaintMiti) : holdnoti(pdata[index].complaintMiti);
//                                                                                   } else {}
//                                                                                 } catch (e) {
//                                                                                   print("Helloi: $e");
//                                                                                 }
//                                                                               },
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ),
//                                                                   );
//                                                                 },
//                                                               );
//                                                             },
//                                                             title: Text(
//                                                               "Change Status",
//                                                               style: TextStyle(
//                                                                 fontSize: 18,
//                                                                 color:
//                                                                     Colors.blue,
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           SizedBox(
//                                                             height:
//                                                                 height * 0.01,
//                                                           ),
//                                                           // TextButton(
//                                                           //     onPressed: () {
//                                                           //       holdnoti(data[
//                                                           //               index]
//                                                           //           .complaintMiti);
//                                                           //       setState(() {
//                                                           //         ishold = true;
//                                                           //         issolved =
//                                                           //             false;
//                                                           //       });
//                                                           //       Navigator.pop(
//                                                           //           context);
//                                                           //     },
//                                                           //     child: Row(
//                                                           //       children: [
//                                                           //         Visibility(
//                                                           //           visible:
//                                                           //               ishold,
//                                                           //           child:
//                                                           //               const Icon(
//                                                           //             Icons.check,
//                                                           //             color: Colors
//                                                           //                 .green,
//                                                           //           ),
//                                                           //         ),
//                                                           //         SizedBox(
//                                                           //           width: width *
//                                                           //               0.04,
//                                                           //         ),
//                                                           //         const Text(
//                                                           //           "Hold",
//                                                           //           style:
//                                                           //               TextStyle(
//                                                           //             color: Colors
//                                                           //                 .black87,
//                                                           //           ),
//                                                           //         ),
//                                                           //       ],
//                                                           //     )),
//                                                           // TextButton(
//                                                           //     onPressed: () {
//                                                           //       solvednoti(data[
//                                                           //               index]
//                                                           //           .complaintMiti);
//                                                           //       setState(() {
//                                                           //         ishold = false;
//                                                           //         issolved = true;
//                                                           //       });
//                                                           //       Navigator.pop(
//                                                           //           context);
//                                                           //     },
//                                                           //     child: Row(
//                                                           //       children: [
//                                                           //         Visibility(
//                                                           //           visible:
//                                                           //               issolved,
//                                                           //           child:
//                                                           //               const Icon(
//                                                           //             Icons.check,
//                                                           //             color: Colors
//                                                           //                 .green,
//                                                           //           ),
//                                                           //         ),
//                                                           //         SizedBox(
//                                                           //           width: width *
//                                                           //               0.04,
//                                                           //         ),
//                                                           //         const Text(
//                                                           //           "Solved",
//                                                           //           style:
//                                                           //               TextStyle(
//                                                           //             color: Colors
//                                                           //                 .black87,
//                                                           //           ),
//                                                           //         ),
//                                                           //       ],
//                                                           //     )),
//                                                         ],
//                                                       ),
//                                                     )
//                                                   ],
//                                                 );
//                                               });
//                                         },
//                                         icon: Icon(
//                                           Icons.more_vert,
//                                           color: Colors.black,
//                                         )),
//                                   ],
//                                 )
//                               ],
//                             )),
//                           ]),
//                     ),
//                     //add a option menu but the menu should pop from bottom

//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     Text(
//                       pdata[index].complaintTitle,
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 17,
//                           color: Colors.black),
//                     ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     ReadMoreText(
//                       pdata[index].complaintDescription,
//                       trimLines: 3,
//                       colorClickableText: Colors.blue,
//                       trimMode: TrimMode.Line,
//                       trimCollapsedText: 'Read more',
//                       trimExpandedText: '...show less',
//                       style: TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),

//                     SizedBox(
//                       height: height * 0.015,
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         pdata[index].imageBytes == null
//                             ? SizedBox()
//                             : InkWell(
//                                 onTap: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return Center(
//                                         child: Wrap(
//                                           children: [
//                                             Align(
//                                               alignment: Alignment.center,
//                                               child: Container(
//                                                 height: height * 0.15,
//                                                 width: width * 0.5,
//                                                 decoration: BoxDecoration(
//                                                     image: DecorationImage(
//                                                         image: MemoryImage(
//                                                             base64Decode(pdata[
//                                                                     index]
//                                                                 .imageBytes
//                                                                 .toString())),
//                                                         fit: BoxFit.fitWidth)),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 },
//                                 child: Row(
//                                   children: [
//                                     Container(
//                                       height: height * 0.15,
//                                       width: width * 0.5,
//                                       decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                               image: MemoryImage(base64Decode(
//                                                   pdata[index]
//                                                       .imageBytes
//                                                       .toString())),
//                                               fit: BoxFit.cover)),
//                                     ),
//                                     SizedBox(width: width * 0.02),
//                                   ],
//                                 ),
//                               ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             makeTwoline(
//                                 "Status:",
//                                 pdata[index].complaintStatus == 0
//                                     ? "Pending"
//                                     : pdata[index].complaintStatus == 1
//                                         ? "Hold"
//                                         : "Solved",
//                                 context),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             makeTwoline("Ward No:",
//                                 pdata[index].wardNo.toString(), context),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             makeTwoline(
//                                 "Priority:",
//                                 pdata[index].priority == 0
//                                     ? "Low"
//                                     : pdata[index].priority == 1
//                                         ? "Medium"
//                                         : "High",
//                                 context),
//                             SizedBox(
//                               height: height * 0.01,
//                             ),
//                             makeTwoline(
//                                 "Category:",
//                                 pdata[index].category == 0
//                                     ? "Water"
//                                     : pdata[index].category == 1
//                                         ? "Road"
//                                         : pdata[index].category == 2
//                                             ? "Health"
//                                             : pdata[index].category == 3
//                                                 ? "Electricity"
//                                                 : "Education",
//                                 context)
//                           ],
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
