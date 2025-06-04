import 'package:equatable/equatable.dart';

abstract class CountryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchCountries extends CountryEvent {
  final String region;

  FetchCountries(this.region);

  @override
  List<Object?> get props => [region];
}
