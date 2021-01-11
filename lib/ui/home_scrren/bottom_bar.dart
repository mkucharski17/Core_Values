import 'package:core_values/constants/types.dart';
import 'package:core_values/ui/home_scrren/bottom_bar_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreenBottomBar extends StatelessWidget {
  final VoidCallbackWithInt onPressed;

  const HomeScreenBottomBar({Key key, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomBarButton(
                onPressed: onPressed,
                iconData: Icons.format_quote,
                text: 'Values',
                destinationIndex: 0,
              ),
              BottomBarButton(
                onPressed: onPressed,
                iconData: Icons.favorite_outline,
                text: 'Favourites',
                destinationIndex: 2,
              ),
            ]),
      ), // new
    );
  }
}
