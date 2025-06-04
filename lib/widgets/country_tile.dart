import 'package:flutter/material.dart';
import '../models/country.dart';
import '../screens/country_details_screen.dart';

class CountryTile extends StatelessWidget {
  final Country country;

  CountryTile({required this.country});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        country.flagUrl,
        width: 50,
        height: 30,
        fit: BoxFit.cover,
      ),
      title: Text(
        country.name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      onTap: () {
        // Navigate to country details page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CountryDetailsScreen(country: country),
          ),
        );
      },
    );
  }
}
