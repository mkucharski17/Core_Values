import 'package:core_values/constants/types.dart';
import 'package:flutter/material.dart';

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    Key key,
    @required this.destinationIndex,
    @required this.text,
    @required this.iconData,
    @required this.onPressed,
  }) : super(key: key);

  final int destinationIndex;
  final String text;
  final IconData iconData;
  final VoidCallbackWithInt onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
        onPressed(destinationIndex),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
          ),
          Text(text)
        ],
      ),
    );
  }
}
