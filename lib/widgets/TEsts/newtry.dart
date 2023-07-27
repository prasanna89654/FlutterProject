// import 'dart:async';
// import 'dart:math' show cos, sqrt, asin;
// import 'package:flare_flutter/flare_actor.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:location/location.dart';
// import 'package:project/view/PublicView/mycomplaintspage.dart/pendingpage.dart';
// import 'package:project/widgets/TEsts/getmap.dart';

// import '../../view/PublicView/publicComplaints.dart';

// const double _cameraZoom = 16.0;

// class MapSample extends ConsumerStatefulWidget {
//   const MapSample({Key? key}) : super(key: key);

//   @override
//   ConsumerState<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends ConsumerState<MapSample> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();
//   final Set<Marker> _markers = {};

//   getinitdata() {
//     getComplaints().then((value) {
//       setState(() {
//         for (int i = 0; i < value.length; i++) {
//           _markers.add(Marker(
//             markerId: MarkerId('targetLocation$i'),
//             infoWindow: InfoWindow(
//               title: value[i].complaintTitle,
//               snippet: value[i].username,
//             ),
//             position: LatLng(
//                 firstString(value[i].location), lastString(value[i].location)),
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//                 BitmapDescriptor.hueGreen),
//           ));
//         }
//       });
//     });
//   }

//   LocationData? pointdata;
//   LocationData? _locationData;
//   int? _distanceToMarker;

//   double? choosedlat;
//   double? choosedlong;

//   @override
//   void initState() {
//     super.initState();
//     getinitdata();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     var location = Location();

//     _locationData = await location.getLocation();
//     setState(() {
//       _markers.add(Marker(
//         markerId: MarkerId('currentLocation'),
//         position: LatLng(_locationData!.latitude!, _locationData!.longitude!),
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//       ));
//     });
//   }

//   void _onMapCreated(GoogleMapController controller) async {
//     _controller.complete(controller);
//   }

//   void _onMapTap(LatLng latLng) {
//     setState(() {
//       _markers
//           .removeWhere((marker) => marker.markerId.value == 'targetLocation');
//       _markers.add(Marker(
//         markerId: MarkerId('targetLocation'),
//         position: latLng,
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//       ));
//       choosedlat = latLng.latitude;
//       choosedlong = latLng.longitude;
//       print(choosedlat);
//       print(choosedlong);

//       final dm = calculateDistanceUsingLatandLong(_locationData!.latitude!,
//           _locationData!.longitude!, latLng.latitude, latLng.longitude);

//       //take only int value
//       _distanceToMarker = dm.toInt();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Choose Location'),
//       ),
//       body: _locationData == null
//           ? const Center(child: CircularProgressIndicator())
//           : Stack(
//               children: [
//                 GoogleMap(
//                   mapType: MapType.normal,
//                   initialCameraPosition: CameraPosition(
//                     target: LatLng(
//                         _locationData!.latitude!, _locationData!.longitude!),
//                     zoom: 18.151926040649414,
//                   ),
//                   onMapCreated: _onMapCreated,
//                   myLocationEnabled: true,
//                   onTap: (argument) {
//                     _onMapTap(argument);
//                   },
//                   markers: _markers,
//                 ),
//                 if (_distanceToMarker != null)
//                   Positioned(
//                     bottom: 0,
//                     child: Container(
//                       width: MediaQuery.of(context).size.width,
//                       color: Colors.white,
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Row(
//                           children: [
//                             Container(
//                               height: 100,
//                               width: 100,
//                               child: FlareActor(
//                                 'assets/location.flr',
//                                 // animation: "location",
//                                 // animation: ,
//                                 fit: BoxFit.contain,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 20,
//                             ),
//                             SizedBox(
//                               width: MediaQuery.of(context).size.width * 0.4,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Distance",
//                                     style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     _distanceToMarker! >= 1000
//                                         ? '${(_distanceToMarker! / 1000).toStringAsFixed(2)} km'
//                                         : '$_distanceToMarker meter',
//                                     style: const TextStyle(
//                                       fontSize: 20,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.blue,
//         child: SizedBox(
//           height: 60.0,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: const ButtonStyle().copyWith(
//                     backgroundColor: MaterialStateProperty.all(Colors.grey)),
//                 child: const Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text('Cancel', style: TextStyle(color: Colors.black)),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   ref.read(locationStateProvider.notifier).setLat(choosedlat!);
//                   ref
//                       .read(locationStateProvider.notifier)
//                       .setLong(choosedlong!);
//                   Navigator.pop(context);
//                   Navigator.pop(context);
//                 },
//                 style: const ButtonStyle().copyWith(
//                     backgroundColor: MaterialStateProperty.all(Colors.green)),
//                 child: const Padding(
//                   padding: EdgeInsets.all(14.0),
//                   child: Text('Select'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// double calculateDistanceUsingLatandLong(
//     latitudefirst, longitudefirst, latitudesecond, longitudesecond) {
//   var perfectDistancetoCalculate = 0.017453292519943295;
//   var accumulatedDistancefromCurrentPosition = 0.5 -
//       cos((latitudesecond - latitudefirst) * perfectDistancetoCalculate) / 2 +
//       cos(latitudefirst * perfectDistancetoCalculate) *
//           cos(latitudesecond * perfectDistancetoCalculate) *
//           (1 -
//               cos((longitudesecond - longitudefirst) *
//                   perfectDistancetoCalculate)) /
//           2;
//   return 12742 * asin(sqrt(accumulatedDistancefromCurrentPosition)) * 1000;
// }
