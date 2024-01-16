import 'package:flutter/material.dart';
import 'restCountries.dart';
import 'country.dart'; // Importez la classe Country
import 'pagePrincipale.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rest Countries',
      home: MainPage(),
    );
  }
}
