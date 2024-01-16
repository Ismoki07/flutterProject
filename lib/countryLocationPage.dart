// country_location_map_page.dart

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'country.dart';
import 'restCountries.dart';


class CountryLocationMapPage extends StatelessWidget {
  final Country country;

  CountryLocationMapPage({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localisation de ${country.name}'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(country.latitude, country.longitude),
          zoom: 4,
        ),
        markers: {
          Marker(
            markerId: MarkerId('CountryMarker'),
            position: LatLng(country.latitude, country.longitude),
            infoWindow: InfoWindow(title: country.name),
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          // Vous pouvez utiliser le contrôleur pour effectuer des actions sur la carte si nécessaire
        },
      ),
    );
  }
}
