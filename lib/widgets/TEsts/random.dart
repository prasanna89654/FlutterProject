import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'dart:math' show cos, sqrt, asin;

import 'getmap.dart';

class RandomPage extends ConsumerStatefulWidget {
  RandomPage({required this.choosedlat, required this.choosedlong, super.key});
  double choosedlat;
  double choosedlong;
  @override
  _RandomPageState createState() => _RandomPageState();
}

class _RandomPageState extends ConsumerState<RandomPage> {
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();
  // double choosedlat = 26.47299742210042;
  // double choosedlong = 87.28232380002737;
  String googleAPiKey = "AIzaSyAuggkY7rh34Rm2tbq1WGRbpVyxFRrJ_Gs";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  // LatLng startLocation = LatLng(27.6683619, 85.3101895);
  // LatLng endLocation = LatLng(27.6688312, 85.3077329);

  @override
  void initState() {
    // _getCurrentLocation();

    // markers.add(Marker(
    //   //add start location marker
    //   markerId: MarkerId(startLocation.toString()),
    //   position: startLocation, //position of marker
    //   infoWindow: InfoWindow(
    //     //popup info
    //     title: 'Starting Point ',
    //     snippet: 'Start Marker',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ));

    // markers.add(Marker(
    //   //add distination location marker
    //   markerId: MarkerId(endLocation.toString()),
    //   position: endLocation, //position of marker
    //   infoWindow: InfoWindow(
    //     //popup info
    //     title: 'Destination Point ',
    //     snippet: 'Destination Marker',
    //   ),
    //   icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    // ));

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var location = Location();

      // ref.read(locationStateProvider.notifier).setLocation() = await location.getLocation();
      LocationData ld = await location.getLocation();
      ref.read(locationStateProvider.notifier).setLocation(ld);
      setState(() {
        markers.add(Marker(
          markerId: const MarkerId('currentLocation'),
          position: LatLng(ld.latitude!, ld.longitude!),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        ));
      });
      getChoosedLocation();
      getDirections();
    }); //get direction when widget is loaded

    // getDirections(); //fetch direction polylines from Google API

    super.initState();
  }

  Future<void> _getCurrentLocation() async {
    var location = Location();

    // ref.read(locationStateProvider.notifier).setLocation() = await location.getLocation();
    LocationData ld = await location.getLocation();
    ref.read(locationStateProvider.notifier).setLocation(ld);
    setState(() {
      markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(ld.latitude!, ld.longitude!),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ));
    });
  }

  Future<void> getChoosedLocation() async {
    setState(() {
      markers.add(Marker(
        markerId: const MarkerId('choosedLocation'),
        position: LatLng(widget.choosedlat, widget.choosedlong),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ));
    });
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];
    var location = Location();

    // ref.read(locationStateProvider.notifier).setLocation() = await location.getLocation();
    LocationData ld = await location.getLocation();
    // ref.read(locationStateProvider.notifier).setLocation(ld);

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(ld.latitude!, ld.longitude!),
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
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );

    setState(() {
      polylines[id] = polyline;
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaint Location"),
      ),
      body: Stack(children: [
        GoogleMap(
          //Map widget from google_maps_flutter package
          // zoomGesturesEnabled: true, //enable Zoom in, out on map
          initialCameraPosition: CameraPosition(
            //innital position in map
            target: LatLng(widget.choosedlat, widget.choosedlong),
            //initial position
            zoom: 18.151926040649414, //initial zoom level
          ),
          markers: markers, //markers to show on map
          polylines: Set<Polyline>.of(polylines.values), //polylines
          mapType: MapType.normal, //map type
          onMapCreated: (controller) {
            //method called when map is created
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
                            "${calculateDistanceUsingLatandLong().toStringAsFixed(2)} meter",
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
      ]),
    );
  }
}
