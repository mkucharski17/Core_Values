import 'package:core_values/bloc/core_values/core_values_cubit.dart';
import 'package:core_values/bloc/favourites/favourites_cubit.dart';
import 'package:core_values/main.dart';
import 'package:core_values/shared_preferences/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) => AppPreferences(),
      child: MultiBlocProvider(providers: [
        BlocProvider<CoreValuesCubit>(
            create: (BuildContext context) =>
                CoreValuesCubit(RepositoryProvider.of(context))),
        BlocProvider<FavouritesCubit>(
            create: (BuildContext context) =>
                FavouritesCubit(RepositoryProvider.of(context)))
      ], child: MyApp()),
    );
  }
}
