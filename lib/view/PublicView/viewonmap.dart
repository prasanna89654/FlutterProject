import 'dart:async';
import 'dart:math' show cos, sqrt, asin;
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:project/view/PublicView/mycomplaintspage.dart/pendingpage.dart';
import 'package:project/widgets/TEsts/getmap.dart';

import '../../view/PublicView/publicComplaints.dart';

const double _cameraZoom = 16.0;

class ViewonMap extends ConsumerStatefulWidget {
  const ViewonMap({Key? key}) : super(key: key);

  @override
  ConsumerState<ViewonMap> createState() => ViewonMapState();
}

class ViewonMapState extends ConsumerState<ViewonMap> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  final Set<Marker> _markers = {};

  getinitdata() {
    getComplaints().then((value) {
      setState(() {
        for (int i = 0; i < value.length; i++) {
          _markers.add(Marker(
            markerId: MarkerId('targetLocation$i'),
            infoWindow: InfoWindow(
              title: value[i].complaintTitle,
              snippet: value[i].username,
            ),
            position: LatLng(
                firstString(value[i].location), lastString(value[i].location)),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
          ));
        }
      });
    });
  }

  LocationData? pointdata;
  LocationData? _locationData;
  int? _distanceToMarker;

  double? choosedlat;
  double? choosedlong;

  @override
  void initState() {
    super.initState();
    getinitdata();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    var location = Location();

    _locationData = await location.getLocation();
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('currentLocation'),
        position: LatLng(_locationData!.latitude!, _locationData!.longitude!),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ));
    });
  }

  void _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Location'),
      ),
      body: _locationData == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        _locationData!.latitude!, _locationData!.longitude!),
                    zoom: 18.151926040649414,
                  ),
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  markers: _markers,
                ),
                if (_distanceToMarker != null)
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
                              child: FlareActor(
                                'assets/location.flr',
                                // animation: "location",
                                // animation: ,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
