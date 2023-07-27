// import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:project/Riverpod/constants.dart';
// import 'package:project/Routes/navigator.dart';
// import 'package:project/view/AdminView/AdminComplaints/AdminComplaintPage.dart';
// import 'package:project/view/AdminView/AdminComplaints/AdminPending.dart';
// import 'package:project/view/AdminView/AdminEventPage.dart';
// import 'package:project/view/AdminView/ComplaintsSatuspage.dart';
// import 'package:project/view/AdminView/Rolespage.dart';
// import 'package:project/view/AdminView/UpdateEventPage.dart';

// class AdminHomePage extends StatefulWidget {
//   const AdminHomePage({super.key});

//   @override
//   State<AdminHomePage> createState() => _AdminHomePageState();
// }

// class _AdminHomePageState extends State<AdminHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Admin Home Page'),
//       ),
//       body:

//           //make gridview of four cards
//           Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
//             child: GridView.count(
//               physics: NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               crossAxisCount: 2,
//               mainAxisSpacing: 10,
//               childAspectRatio: 1.2,
//               children: [
//                 cardmaker(Icons.person, "Manage Roles", Colors.blue,
//                     RolesPage(), context),
//                 cardmaker(Icons.subject, "View all complaints", Colors.green,
//                     AdminComplaintsPage(), context),
//                 cardmaker(Icons.event, "Add Events", Colors.purple,
//                     AdminEventPage(), context),
//                 cardmaker(Icons.update, "Update Events", Colors.blue,
//                     UpdateEventsPage(), context),
//                 cardmaker(Icons.track_changes, "Complaints Status", Colors.blue,
//                     ComplaintStatusPage(), context),
//                 // cardmaker(Icons.person, "Manage Roles", Colors.blue),
//                 InkWell(
//                   onTap: () async {
//                     await setValue(accessToken, "");
//                     await setValue(userType, "");
//                     AppNavigatorService.pushNamedAndRemoveUntil('login');
//                   },
//                   child: Card(
//                     elevation: 5,
//                     color: Colors.blue.shade200,
//                     child: Center(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 20.0, horizontal: 10),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               Icons.logout,
//                               size: 40,
//                               color: Colors.red.shade300,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               'logout',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// cardmaker(IconData icon, String text, Color color, Widget page,
//     BuildContext context) {
//   return InkWell(
//     onTap: () {
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => page,
//           ));
//     },
//     child: Card(
//       elevation: 5,
//       color: Colors.blue.shade200,
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Icon(
//                 icon,
//                 size: 40,
//                 color: color,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 text,
//                 style: TextStyle(color: Colors.black),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
