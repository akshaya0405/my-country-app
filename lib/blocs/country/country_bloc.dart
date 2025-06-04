import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/api_service.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final ApiService apiService;

  CountryBloc(this.apiService) : super(CountryInitial()) {
    on<FetchCountries>((event, emit) async {
      emit(CountryLoading());
      try {
        final countries = await apiService.fetchCountriesByRegion(event.region);
        emit(CountryLoaded(countries));
      } catch (e) {
        emit(CountryError("Failed to load countries"));
      }
    });
  }
}
