
import 'package:flutter/material.dart';
import 'restCountries.dart';
import 'country.dart';
import 'detailsPage.dart';


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des pays'),
        backgroundColor: Colors.purpleAccent, // Changer la couleur de l'AppBar
      ),
      body: FutureBuilder(
        future: RestCountries.getCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Country> countries = snapshot.data as List<Country>;
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16), // Ajuster le décalage du contenu
                      title: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 50,
                            child: Image.network(
                              countries[index].flag,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 18), // Espacement entre le drapeau et le texte
                          Text(countries[index].name),
                        ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CountryDetailsPage(country: countries[index]),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
