import 'package:flutter/material.dart';
import 'restCountries.dart';
import 'pagePrincipale.dart';
import 'country.dart';
import 'countryLocationPage.dart';

class CountryDetailsPage extends StatelessWidget {
  final Country country;

  CountryDetailsPage({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.purple,
              child: Center(
                child: Container(
                  width: 150,
                  height: 100,
                  child: Image.network(
                    country.flag,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.location_city, 'Capitale', country.capital),
                  _buildInfoRow(Icons.people, 'Population', country.population),
                  _buildInfoRow(Icons.language, 'Langue', country.officialLanguage),
                  _buildInfoRow(Icons.map, 'Superficie', '${country.area} km²'),
                  _buildLocationButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationButton(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryLocationMapPage(country: country),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.orange, // Couleur du bouton
          onPrimary: Colors.white, // Couleur du texte
        ),
        child: Text('Voir la localisation sur la carte'),
      ),
    );
  }
}
