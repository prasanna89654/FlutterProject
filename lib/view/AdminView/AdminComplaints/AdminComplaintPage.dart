// import 'package:flutter/material.dart';
// import 'package:project/view/AdminView/AdminComplaints/AdminPending.dart';
// import 'package:project/view/AdminView/AdminComplaints/hold.dart';
// import 'package:project/view/AdminView/AdminComplaints/solved.dart';
// import 'package:project/view/PublicView/mycomplaintspage.dart/pendingpage.dart';
// import 'package:project/view/PublicView/mycomplaintspage.dart/solvedpage.dart';

// class AdminComplaintsPage extends StatefulWidget {
//   const AdminComplaintsPage({super.key});

//   @override
//   State<AdminComplaintsPage> createState() => _AdminComplaintsPageState();
// }

// class _AdminComplaintsPageState extends State<AdminComplaintsPage>
//     with SingleTickerProviderStateMixin {
//   TabController? tabController;

//   @override
//   void initState() {
//     tabController = TabController(length: 3, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         elevation: 0,
//         // centerTitle: true,
//         title: const Text("Public Complaints"),
//       ),
//       body: Column(children: [
//         Material(
//           color: Colors.blue,
//           child: TabBar(
//             controller: tabController,
//             indicatorColor: Colors.white,
//             labelStyle:
//                 const TextStyle(fontWeight: FontWeight.bold, fontSize: 16
//                     // color: Colors.black,
//                     ),
//             labelColor: Colors.white,
//             tabs: const [
//               Tab(
//                 text: "Pending",
//               ),
//               Tab(
//                 text: "Hold",
//               ),
//               Tab(text: "Solved")
//             ],
//           ),
//         ),
//         Expanded(
//           child: TabBarView(
//               controller: tabController,
//               children: const [PendingPage(), HoldPage(), AdminSolvedPage()]),
//         ),
//       ]),
//     );
//   }
// }
