import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPicker extends StatefulWidget {
  static const DEFAULT_ZOOM = 14.4746;
  static const KINSHASA_LOCATION = LatLng(-4.325, 15.322222);

  double initZoom;
  LatLng initCoordinates;

  LatLng? value;

  MapPicker(
      {Key? key,
      this.initZoom = DEFAULT_ZOOM,
      this.initCoordinates = KINSHASA_LOCATION})
      : super(key: key);

  @override
  State<MapPicker> createState() => _MapPickerState();
}

class _MapPickerState extends State<MapPicker> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          // width: 400,
          height: 300,
          child: LayoutBuilder(
            builder: (context, constraints) {
              var maxWidth = constraints.biggest.width;
              var maxHeight = constraints.biggest.height;

              return Stack(
                children: <Widget>[
                  SizedBox(
                    height: maxHeight,
                    width: maxWidth,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: widget.initCoordinates,
                        zoom: widget.initZoom,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      onCameraMove: (CameraPosition newPosition) {
                        // print(newPosition.target.toJson());
                        widget.value = newPosition.target;
                      },
                      mapType: MapType.normal,
                      myLocationButtonEnabled: true,
                      myLocationEnabled: false,
                      zoomGesturesEnabled: true,
                      padding: const EdgeInsets.all(0),
                      buildingsEnabled: true,
                      cameraTargetBounds: CameraTargetBounds.unbounded,
                      compassEnabled: true,
                      indoorViewEnabled: false,
                      mapToolbarEnabled: true,
                      minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                      rotateGesturesEnabled: true,
                      scrollGesturesEnabled: true,
                      tiltGesturesEnabled: true,
                      trafficEnabled: false,
                    ),
                  ),
                  Positioned(
                    bottom: maxHeight / 2,
                    right: (maxWidth - 30) / 2,
                    child: const Icon(
                      Icons.person_pin_circle,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 30,
                    child: Container(
                      color: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.my_location),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
