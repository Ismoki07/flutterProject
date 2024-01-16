class Country {
  String name;
  String capital;
  String population;
  String flag; // Ajout de la propriété pour le drapeau
  String area; // Ajout de la propriété pour la superficie
  String officialLanguage; // Ajout de la propriété pour la langue officielle
  double latitude; // Ajout de la propriété pour la latitude
  double longitude; // Ajout de la propriété pour la longitude

  Country({
    required this.name,
    required this.capital,
    required this.population,
    required this.flag,
    required this.area,
    required this.officialLanguage,
    required this.latitude,
    required this.longitude,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    final name = json['name']['common'];
    final capital = json['capital']?[0] ?? 'N/A';
    final population = json['population']?.toString() ?? 'N/A';
    final flag = json['flags']['png'];
    final area = json['area']?.toString() ?? 'N/A';
    final officialLanguage = json['languages']?.keys.first ?? 'N/A';
    final latitude = json['latlng']?.isEmpty ?? false ? 0.0 : json['latlng'][0];
    final longitude = json['latlng']?.isEmpty ?? false ? 0.0 : json['latlng'][1];

    return Country(
      name: name ?? 'N/A',
      capital: capital,
      population: population,
      flag: flag ?? 'N/A',
      area: area,
      officialLanguage: officialLanguage,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
