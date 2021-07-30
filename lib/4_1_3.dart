import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class Four13 extends StatefulWidget {
  @override
  _Four13State createState() => _Four13State();
}

class _Four13State extends State<Four13> {
  static const LatLng _center = const LatLng(20.5937, 78.9629);
  late Completer _controller = Completer();
  MapType _currentMapType = MapType.normal;

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller.complete(_cntlr);
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    final _ht = MediaQuery.of(context).size.height;
    final _wd = MediaQuery.of(context).size.width;
    final _topPadding = MediaQuery.of(context).padding.top;
    final _total = _ht - _topPadding;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: _topPadding,
          ),
          Container(
            margin: EdgeInsets.only(top: _total * 0.1),
            height: _total * 0.1,
            child: Text(
              "Google Map View",
              style: TextStyle(fontSize: 35),
            ),
          ),
          Container(
            height: _total * 0.75,
            width: _wd * 0.8,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _center, zoom: 20),
                  mapType: _currentMapType,
                  onCameraMove: _onCameraMove,
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  zoomControlsEnabled: true,
                  markers: _markers,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: [
                        FloatingActionButton(
                          onPressed: () => _onMapTypeButtonPressed(),
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.map, size: 36.0),
                        ),
                        SizedBox(height: 16.0),
                        FloatingActionButton(
                          onPressed: _onAddMarkerButtonPressed,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          backgroundColor: Colors.green,
                          child: const Icon(Icons.add_location, size: 36.0),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 75,
        width: 75,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 30,
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
