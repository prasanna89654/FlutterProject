// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:project/widgets/TEsts/random.dart';

// import 'newtry.dart';

// class SendMapPage extends ConsumerStatefulWidget {
//   const SendMapPage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _SendMapPageState();
// }

// class _SendMapPageState extends ConsumerState<SendMapPage> {
//   String? location;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Send Map Page"),
//       ),
//       body: Center(
//           child: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//               context, MaterialPageRoute(builder: (context) => MapSample()));
//         },
//         child: Text("Send Location"),
//       )),
//     );
//   }
// }
