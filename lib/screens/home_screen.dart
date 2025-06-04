import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/country/country_bloc.dart';
import '../blocs/country/country_event.dart';
import '../blocs/country/country_state.dart';
import '../widgets/theme_toggle.dart';
import '../widgets/country_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedRegion;

  final List<String> regions = [
    "Asia",
    "Europe",
    "Africa",
    "Americas",
    "Oceania"
  ];

  final Map<String, Color> regionColors = {
    "Asia": Colors.red,
    "Europe": Colors.blue,
    "Africa": Colors.green,
    "Americas": Colors.orange,
    "Oceania": Colors.purple,
  };

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor =
        isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200;
    return Scaffold(
      appBar: AppBar(
        title: Text("Regions"),
        actions: [ThemeToggle()],
        backgroundColor: backgroundColor,
      ),
      body: Row(
        children: [
          Container(
            width: 140,
            color: backgroundColor,
            child: ListView.builder(
              itemCount: regions.length,
              itemBuilder: (context, index) {
                final region = regions[index];
                final isSelected = selectedRegion == region;
                return GestureDetector(
                  onTap: () {
                    //convert into event
                    setState(() => selectedRegion = region);
                    context.read<CountryBloc>().add(FetchCountries(region));
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                      color: regionColors[region],
                      borderRadius: BorderRadius.circular(8),
                      border: isSelected
                          ? Border.all(width: 3, color: Colors.black)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        region,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: selectedRegion == null
                ? Center(child: Text("No region selected, select a region"))
                : BlocBuilder<CountryBloc, CountryState>(
                    builder: (context, state) {
                      if (state is CountryLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is CountryLoaded) {
                        return ListView.builder(
                          itemCount: state.countries.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 8),
                              decoration: BoxDecoration(
                                color: regionColors[selectedRegion]
                                    ?.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:
                                  CountryTile(country: state.countries[index]),
                            );
                          },
                        );
                      }
                      if (state is CountryError) {
                        return Center(child: Text(state.message));
                      }
                      return Center(child: Text("Select a region"));
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
