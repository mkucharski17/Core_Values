import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  SharedPreferences _sharedPreferences;

  Future<void> initialize()async{
    if(_sharedPreferences == null)
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<List<String>> addValueAndGetUpdated(
      String key, String newValue) async {
    final List<String> currentValues = _sharedPreferences.getStringList(key)
      ..add(newValue);
    await _sharedPreferences.setStringList(key, currentValues);
    return currentValues;
  }

  Future<List<String>> removeValueAndGetUpdated(
      String key, String valueToDelete) async {
    final List<String> currentValues = _sharedPreferences.getStringList(key)
      ..remove(valueToDelete);
    await _sharedPreferences.setStringList(key, currentValues);
    return currentValues;
  }

  Future<List<String>> toggleAndGetValues(String key, String value) async {
    final List<String> currentValues =
        _sharedPreferences.getStringList(key) ?? <String>[];
    if (currentValues.contains(value))
      currentValues.remove(value);
    else
      currentValues.add(value);
    await _sharedPreferences.setStringList(key, currentValues);
    return currentValues;
  }

  List<String> getStringList(String key) =>
      _sharedPreferences.getStringList(key);

  void saveStringList(String key, List<String> stringList) =>
      _sharedPreferences.setStringList(key,stringList);
}
