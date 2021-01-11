import 'package:core_values/ui/add_value/add_value_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreenFAB extends StatelessWidget {
  const HomeScreenFAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).accentColor,
      child: Icon(Icons.add, size: 45,),
      onPressed: () =>
          showDialog(
              context: context, builder: (_) => AddValueDialog())
      ,
    );
  }
}