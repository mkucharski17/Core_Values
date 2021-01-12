import 'package:bloc/bloc.dart';
import 'package:core_values/constants/shared_preferences_keys.dart';
import 'package:core_values/shared_preferences/app_preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  final AppPreferences appPreferences;

  FavouritesCubit(this.appPreferences) : super(FavouritesInitial()) {
    initializeValues();
  }

  void initializeValues() async {
    await appPreferences.initialize();

    final List<String> currentValues =
        appPreferences.getStringList(favouritesSharePrefKey) ?? <String>[];
    emit(FavouritesUpdated(currentValues));
  }

  void toggleValue(String value) async {
    final List<String> currentValues = await appPreferences
        .toggleAndGetValues(favouritesSharePrefKey, value);
    emit(FavouritesUpdated(currentValues));
  }


}
