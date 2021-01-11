import 'package:bloc_test/bloc_test.dart';
import 'package:core_values/bloc/core_values/core_values_cubit.dart';
import 'package:core_values/constants/core_values.dart';
import 'package:core_values/constants/shared_preferences_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

void main() {
  final newValue = 'newValue';
  AppPreferencesMock _appPreferencesMock;
  setUp(() {
    _appPreferencesMock = AppPreferencesMock();
  });

  group('initializing :', () {
    blocTest<CoreValuesCubit, CoreValuesState>(
        'values saved in Shared Preferences',
        build: () {
          when(_appPreferencesMock.initialize()).thenAnswer((_) async => null);
          when(_appPreferencesMock.getStringList(coreValuesSharedPrefKey))
              .thenAnswer((realInvocation) => netguruCoreValues);
          return CoreValuesCubit(_appPreferencesMock);
        },
        expect: <CoreValuesState>[CoreValuesUpdated(netguruCoreValues)],
        verify: (_) {
          verify(_appPreferencesMock.initialize()).called(1);
          verify(_appPreferencesMock.getStringList(coreValuesSharedPrefKey))
              .called(1);
        });

    blocTest<CoreValuesCubit, CoreValuesState>(
        'values not saved in Shared Preferences',
        build: () {
          when(_appPreferencesMock.initialize()).thenAnswer((_) async => null);
          when(_appPreferencesMock.getStringList(coreValuesSharedPrefKey))
              .thenAnswer((realInvocation) => []);
          return CoreValuesCubit(_appPreferencesMock);
        },
        expect: <CoreValuesState>[CoreValuesUpdated(netguruCoreValues)],
        verify: (_) {
          verify(_appPreferencesMock.initialize()).called(1);
          verify(_appPreferencesMock.getStringList(coreValuesSharedPrefKey))
              .called(1);
        });
  });

  blocTest<CoreValuesCubit, CoreValuesState>('addValue',
      build: () {
        when(_appPreferencesMock.initialize()).thenAnswer((_) async => null);
        when(_appPreferencesMock.getStringList(coreValuesSharedPrefKey))
            .thenAnswer((_) => netguruCoreValues);
        when(_appPreferencesMock.addValueAndGetUpdated(
                coreValuesSharedPrefKey, newValue))
            .thenAnswer((_) async => [...netguruCoreValues, newValue]);
        return CoreValuesCubit(_appPreferencesMock);
      },
      act: (CoreValuesCubit cubit) {
        cubit.addValue(newValue);
      },
      expect: <CoreValuesState>[
        CoreValuesUpdated(netguruCoreValues),
        CoreValuesUpdated([...netguruCoreValues, newValue])
      ],
      verify: (_) {
        verify(_appPreferencesMock.initialize()).called(1);
        verify(_appPreferencesMock.getStringList(coreValuesSharedPrefKey))
            .called(1);
      });
}
