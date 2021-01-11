import 'package:bloc_test/bloc_test.dart';
import 'package:core_values/bloc/favourites/favourites_cubit.dart';
import 'package:core_values/constants/shared_preferences_keys.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

void main() {
  final favouriteValue = 'favouriteValue';
  AppPreferencesMock _appPreferencesMock;
  setUp(() {
    _appPreferencesMock = AppPreferencesMock();
  });

  group('initializing :', () {
    blocTest<FavouritesCubit, FavouritesState>('no favourites value saved',
        build: () {
          when(_appPreferencesMock.initialize()).thenAnswer((_) async => null);
          when(_appPreferencesMock.getStringList(favouritesSharePrefKey))
              .thenAnswer((_) => []);
          return FavouritesCubit(_appPreferencesMock);
        },
        expect: <FavouritesState>[],
        verify: (_) {
          verify(_appPreferencesMock.initialize()).called(1);
          verify(_appPreferencesMock.getStringList(favouritesSharePrefKey))
              .called(1);
        });

    blocTest<FavouritesCubit, FavouritesState>('some favourites value saved',
        build: () {
          when(_appPreferencesMock.initialize()).thenAnswer((_) async => null);
          when(_appPreferencesMock.getStringList(favouritesSharePrefKey))
              .thenAnswer((_) => [favouriteValue]);
          return FavouritesCubit(_appPreferencesMock);
        },
        expect: <FavouritesState>[
          FavouritesUpdated([favouriteValue])
        ],
        verify: (_) {
          verify(_appPreferencesMock.initialize()).called(1);
          verify(_appPreferencesMock.getStringList(favouritesSharePrefKey))
              .called(1);
        });
  });

  group('toggling tests', () {
    blocTest<FavouritesCubit, FavouritesState>('add value',
        build: () {
          when(_appPreferencesMock.initialize()).thenAnswer((_) async => null);
          when(_appPreferencesMock.getStringList(favouritesSharePrefKey))
              .thenAnswer((_) => []);
          when(_appPreferencesMock.toggleAndGetValues(
                  favouritesSharePrefKey, favouriteValue))
              .thenAnswer((_) async => [favouriteValue]);
          return FavouritesCubit(_appPreferencesMock);
        },
        act: (FavouritesCubit cubit) {
          cubit.toggleValue(favouriteValue);
        },
        expect: <FavouritesState>[
          FavouritesUpdated([favouriteValue])
        ],
        verify: (_) {
          verify(_appPreferencesMock.initialize()).called(1);
          verify(_appPreferencesMock.getStringList(favouritesSharePrefKey))
              .called(1);
          verify(_appPreferencesMock.toggleAndGetValues(
                  favouritesSharePrefKey, favouriteValue))
              .called(1);
        });

    blocTest<FavouritesCubit, FavouritesState>('delete value',
        build: () {
          when(_appPreferencesMock.initialize()).thenAnswer((_) async => null);
          when(_appPreferencesMock.getStringList(favouritesSharePrefKey))
              .thenAnswer((_) => [favouriteValue]);
          when(_appPreferencesMock.toggleAndGetValues(
                  favouritesSharePrefKey, favouriteValue))
              .thenAnswer((_) async => []);
          return FavouritesCubit(_appPreferencesMock);
        },
        act: (FavouritesCubit cubit) {
          cubit.toggleValue(favouriteValue);
        },
        expect: <FavouritesState>[
          FavouritesUpdated([favouriteValue]),
          FavouritesUpdated([])
        ],
        verify: (_) {
          verify(_appPreferencesMock.initialize()).called(1);
          verify(_appPreferencesMock.getStringList(favouritesSharePrefKey))
              .called(1);
          verify(_appPreferencesMock.toggleAndGetValues(
                  favouritesSharePrefKey, favouriteValue))
              .called(1);
        });
  });
}
