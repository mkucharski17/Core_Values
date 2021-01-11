import 'package:core_values/bloc/favourites/favourites_cubit.dart';
import 'package:core_values/ui/core_value_list/core_value_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesListScreen extends StatefulWidget {
  @override
  _FavouritesListScreenState createState() => _FavouritesListScreenState();
}

class _FavouritesListScreenState extends State<FavouritesListScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        if (state is FavouritesUpdated)
          return CoreValueListWidget(
            coreValues: state.coreValues,
            listName: 'Favourites',
          );
        else
          return CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          );
      },
    );
  }
}
