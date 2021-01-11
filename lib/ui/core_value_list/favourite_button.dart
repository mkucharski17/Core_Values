import 'package:core_values/bloc/favourites/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    Key key,
    @required this.coreValueText,
  }) : super(key: key);

  final String coreValueText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesCubit, FavouritesState>(
      builder: (context, state) {
        bool isFavourite = false;
        if (state is FavouritesUpdated)
          isFavourite = state.coreValues.contains(coreValueText);
        return InkWell(
            child: Icon(
              isFavourite ? Icons.favorite_outlined : Icons.favorite_outline,
              color: Theme.of(context).accentColor,
              size: 20,
            ),
            onTap: () {
              BlocProvider.of<FavouritesCubit>(context)
                  .toggleValue(coreValueText);
            });
      },
    );
  }
}
