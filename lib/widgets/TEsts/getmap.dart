import 'dart:async';
import 'dart:math' show cos, sqrt, asin;
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';

class GetSample extends ConsumerStatefulWidget {
  GetSample({required this.choosedlat, required this.choosedlong, super.key});
  double choosedlat;
  double choosedlong;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GetSampleState();
}

class _GetSampleState extends ConsumerState<GetSample> {
  //  Completer<GoogleMapController> _controller =
  // Completer<GoogleMapController>();
  GoogleMapController? mapController; //contrller for Google map

  final Set<Marker> _markers = {};
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction
  String googleAPiKey = "AIzaSyAuggkY7rh34Rm2tbq1WGRbpVyxFRrJ_Gs";

  PolylinePoints polylinePoints = PolylinePoints();
  LatLng startLocation = LatLng(27.6683619, 85.3101895);
  LatLng endLocation = LatLng(27.6688312, 85.3077329);

  // double choosedlat = 26.47299742210042;
  // double choosedlong = 87.28232380002737;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentLocation();
      getChoosedLocation();
      getDirections();
    }); //get direction when widget is loaded

    // setState(() {
    //   _markers.add(Marker(
    //     markerId: const MarkerId('currentLocation'),
    //     position: LatLng(choosedlat, choosedlong),
    //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    //   ));
    // });
    super.initState();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];
    var location = Location();
    var currentLocation = await location.getLocation();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(currentLocation.latitude!, currentLocation.longitude!),
      PointLatLng(widget.choosedlat, widget.choosedlong),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    // addPolyLine(polylineCoordinates);
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  // addPolyLine(List<LatLng> polylineCoordinates) {
  //   PolylineId id = PolylineId("poly");
  //   Polyline polyline = Polyline(
  //     polylineId: id,
  //     color: Colors.deepPurpleAccent,
  //     points: polylineCoordinates,
  //     width: 8,
  //   );
  //   polylines[id] = polyline;
  //   setState(() {});
  // }

  Future<void> _getCurrentLocation() async {
    var location = Location();

    // ref.read(locationStateProvider.notifier).setLocation() = await location.getLocation();
    LocationData ld = await location.getLocation();
    ref.read(locationStateProvider.notifier).setLocation(ld);
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(
            ref.watch(locationStateProvider).getLocation()!.latitude!,
            ref.watch(locationStateProvider).getLocation()!.longitude!),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ));
    });
  }

  Future<void> getChoosedLocation() async {
    setState(() {
      _markers.add(Marker(
        markerId: const MarkerId('choosedLocation'),
        position: LatLng(widget.choosedlat, widget.choosedlong),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    });
  }

  double calculateDistanceUsingLatandLong() {
    if (ref.watch(locationStateProvider).getLocation() == null) {
      return 0;
    } else {
      final lat1 = ref.watch(locationStateProvider).getLocation()!.latitude!;
      final lon1 = ref.watch(locationStateProvider).getLocation()!.longitude!;
      final lat2 = widget.choosedlat;
      final lon2 = widget.choosedlong;
      var p = 0.017453292519943295;
      var a = 0.5 -
          cos((lat2 - lat1) * p) / 2 +
          cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
      return 12742 * asin(sqrt(a)) * 1000;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(polylines.length);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps Sample App'),
      ),
      body: ref.watch(locationStateProvider).getLocation() == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.choosedlat, widget.choosedlong),
                    zoom: 18.151926040649414,
                  ),
                  myLocationEnabled: true,
                  polylines: Set<Polyline>.of(polylines.values),
                  markers: _markers,
                  onMapCreated: (controller) {
                    // _onMapCreated(controller);
                    setState(() {
                      mapController = controller;
                    });
                  },
                ),
                if (ref.watch(locationStateProvider).getLocation() != null)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: const FlareActor(
                                'assets/location.flr',
                                // animation: "location",
                                // animation: ,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Distance",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    calculateDistanceUsingLatandLong() >= 1000
                                        ? '${(calculateDistanceUsingLatandLong() / 1000).toStringAsFixed(2)} km'
                                        : '$calculateDistanceUsingLatandLong() meter',
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.blue,
      //   child: SizedBox(
      //     height: 60.0,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         ElevatedButton(
      //           onPressed: () {
      //             Navigator.pop(context);
      //           },
      //           style: const ButtonStyle().copyWith(
      //               backgroundColor: MaterialStateProperty.all(Colors.grey)),
      //           child: const Padding(
      //             padding: EdgeInsets.all(14.0),
      //             child: Text('Cancel', style: TextStyle(color: Colors.black)),
      //           ),
      //         ),
      //         ElevatedButton(
      //           onPressed: () {},
      //           style: const ButtonStyle().copyWith(
      //               backgroundColor: MaterialStateProperty.all(Colors.green)),
      //           child: const Padding(
      //             padding: EdgeInsets.all(14.0),
      //             child: Text('Select'),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class LocationState extends ChangeNotifier {
  LocationData? currentLocation;
  double? lat;
  double? long;
  setLocation(LocationData location) {
    currentLocation = location;
    notifyListeners();
  }

  LocationData? getLocation() {
    return currentLocation;
  }

  setLat(double lat) {
    this.lat = lat;
    notifyListeners();
  }

  setLong(double long) {
    this.long = long;
    notifyListeners();
  }

  //concate both lat and long
  String? conl() {
    return "$lat+$long";
  }

  deletelatlong() {
    lat = null;
    long = null;
    notifyListeners();
  }
}

final locationStateProvider =
    ChangeNotifierProvider<LocationState>((ref) => LocationState());
