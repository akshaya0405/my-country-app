class Country {
  final String name;
  final String flagUrl;
  final String callingCode;
  final int population;
  // final String capital;
  final String region;
  final String subregion;

  Country({
    required this.name,
    required this.flagUrl,
    required this.callingCode,
    required this.population,
    // required this.capital,
    required this.region,
    required this.subregion,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        name: json["name"],
        flagUrl: json["flags"]["png"],
        callingCode:
            json["callingCodes"].isNotEmpty ? json["callingCodes"][0] : "",
        population: json["population"],
        // capital: json["capital"],
        region: json["region"] ?? "Unknown",
        subregion: json["subregion"] ?? "Unknown");
  }
}
