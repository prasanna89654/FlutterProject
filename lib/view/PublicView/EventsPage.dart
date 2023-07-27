// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:project/Riverpod/Repository/EventController.dart';
// import 'package:readmore/readmore.dart';

// import '../../Riverpod/Models/userModel.dart';
// import '../../Riverpod/baseDIo.dart';
// import '../../Riverpod/config.dart';
// import 'mycomplaintspage.dart/pendingpage.dart';

// class EventsPage extends ConsumerStatefulWidget {
//   const EventsPage({super.key});

//   @override
//   ConsumerState<EventsPage> createState() => _EventsPageState();
// }

// class _EventsPageState extends ConsumerState<EventsPage> {
//   List<EventModel> datas = [];

//   getinitdata() {
//     getEvents().then((value) {
//       setState(() {
//         datas = value;
//       });
//       datas.sort((a, b) => b.id.compareTo(a.id));
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getinitdata();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     // final details = ref.watch(getalleventsProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Events"),
//       ),
//       body: ListView.builder(
//         itemCount: datas.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.only(
//                 left: 2.0, right: 2.0, top: 4.0, bottom: 6),
//             child: Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(0),
//                   color: Colors.grey.shade200),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: 10.0, left: 13, right: 13, bottom: 10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     datas[index].imageBytes == null
//                         ? SizedBox()
//                         : Container(
//                             height: height * 0.2,
//                             width: width,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image: MemoryImage(base64Decode(
//                                         datas[index].imageBytes.toString())),
//                                     fit: BoxFit.cover)),
//                           ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(0.0),
//                       child: Text(
//                         datas[index].title,
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 17,
//                             color: Colors.black),
//                       ),
//                     ),
//                     SizedBox(
//                       height: height * 0.01,
//                     ),
//                     ReadMoreText(
//                       datas[index].shortDescription,
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
//                     Column(
//                       children: [
//                         makeTwoline(
//                             "Location:", datas[index].location, context),
//                         SizedBox(
//                           height: height * 0.01,
//                         ),
//                         makeTwoline("Date:", datas[index].eventMiti, context),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// Future<List<EventModel>> getEvents() async {
//   final response = await Api().get(MyConfig.geteventsURL);

//   if (response.statusCode == 200) {
//     Map<String, dynamic> map = json.decode(response.data);
//     List<dynamic> data = map["result"]["items"];

//     return data.map((data) => EventModel.fromJson(data)).toList();
//   } else {
//     List<EventModel> a = [];
//     return a;
//   }
// }
