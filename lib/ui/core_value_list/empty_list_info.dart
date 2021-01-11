
import 'package:flutter/material.dart';

class EmptyListInfo extends StatelessWidget {
  const EmptyListInfo({
    Key key,
    @required this.listName,
  }) : super(key: key);

  final String listName;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Text(
          'You do not have any values marked as $listName',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ));
  }
}
