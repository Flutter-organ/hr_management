import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../../core/presentation/design_system/components/custom_clockin_area_map_user.dart';

class ClockInMap extends StatefulWidget {
  final bool isPopupVisible;
  final LatLng userLocation;
  final VoidCallback onMarkerTap;

  const ClockInMap({
    super.key,
    required this.userLocation,
    required LatLng officeLocation,
    this.isPopupVisible = false, required this.onMarkerTap,
  });

  @override
  State<ClockInMap> createState() => _ClockInMapState();
}

class _ClockInMapState extends State<ClockInMap> {
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(center: widget.userLocation, zoom: 16),
      children: [
        TileLayer(
          urlTemplate:
          'https://api.maptiler.com/maps/hybrid/{z}/{x}/{y}.png?key=54uUzuarknk6ofvWlZlV',
          userAgentPackageName: 'com.example.app',
        ),

        CircleLayer(
          circles: [
            CircleMarker(
              point: widget.userLocation!,
              radius: 120,
              useRadiusInMeter: true,
              color: Colors.deepPurple.withOpacity(0.15),
              borderColor: Colors.deepPurple,
              borderStrokeWidth: 2,
            ),
          ],
        ),

        MarkerLayer(
          markers: [
            Marker(
              point: widget.userLocation!,
              width: 70,
              height: 70,
              child: GestureDetector(
                onTap: widget.onMarkerTap,
                child: CustomClockInAreaMapUser(
                  imageUrl: "https://i.pravatar.cc/150",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
