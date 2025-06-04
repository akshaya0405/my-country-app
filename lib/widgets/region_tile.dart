import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/country/country_bloc.dart';
import '../blocs/country/country_event.dart';

class RegionTile extends StatelessWidget {
  final String regionName;

  RegionTile({required this.regionName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Fetch countries when region is clicked
        context.read<CountryBloc>().add(FetchCountries(regionName));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.7), // Adjust based on region
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          regionName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
