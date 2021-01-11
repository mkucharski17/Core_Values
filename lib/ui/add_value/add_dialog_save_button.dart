import 'package:flutter/material.dart';

class AddDialogSaveButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddDialogSaveButton({Key key, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      minWidth: double.infinity,
      color: Theme.of(context).accentColor,
      textColor: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Text("Save"),
    );
  }
}
