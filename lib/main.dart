import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/country/country_bloc.dart';
import 'blocs/theme/theme_bloc.dart';
import 'blocs/theme/theme_state.dart';
import 'screens/home_screen.dart';
import 'services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountryBloc(ApiService())),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeData themeData;
          if (state is LightThemeState) {
            themeData = state.themeData;
          } else if (state is DarkThemeState) {
            themeData = state.themeData;
          } else {
            themeData = ThemeData.light(); // 👈 Prevents null error
          }

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData, // 👈 Apply theme correctly
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
