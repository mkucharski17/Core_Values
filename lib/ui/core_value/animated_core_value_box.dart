import 'package:flutter/material.dart';

class AnimatedCoreValueBox extends StatelessWidget {
  final String valueText;
  final Animation<Offset> offset;

  const AnimatedCoreValueBox(
      {Key key, @required this.offset, @required this.valueText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SlideTransition(
        position: offset,
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.1, vertical: size.height * 0.15),
            child: Text(
              valueText,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline4
            )));
  }
}
