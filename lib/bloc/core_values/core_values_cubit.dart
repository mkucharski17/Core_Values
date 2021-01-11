import 'package:bloc/bloc.dart';
import 'package:core_values/constants/core_values.dart';
import 'package:core_values/constants/shared_preferences_keys.dart';
import 'package:core_values/shared_preferences/app_preferences.dart';
import 'package:equatable/equatable.dart';

part 'core_values_state.dart';

class CoreValuesCubit extends Cubit<CoreValuesState> {
  final AppPreferences appPreferences;

  CoreValuesCubit(this.appPreferences) : super(CoreValuesInitial()) {
    initializeValues();
  }

  void initializeValues() async {
    await appPreferences.initialize();
    final List<String> currentValues =
        appPreferences.getStringList(coreValuesSharedPrefKey) ?? <String>[];
    if (currentValues.isEmpty) {
      appPreferences.saveStringList(coreValuesSharedPrefKey, netguruCoreValues);
      currentValues.addAll(netguruCoreValues);
    }
    emit(CoreValuesUpdated(currentValues ?? netguruCoreValues));
  }

  void addValue(String newValue) async {
    final List<String> currentValues = await appPreferences
        .addValueAndGetUpdated(coreValuesSharedPrefKey, newValue);
    emit(CoreValuesUpdated(currentValues));
  }
}
