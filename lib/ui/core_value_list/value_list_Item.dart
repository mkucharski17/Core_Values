import 'package:core_values/ui/core_value_list/favourite_button.dart';
import 'package:flutter/material.dart';

class ValueListItem extends StatelessWidget {
  final String coreValueText;

  ValueListItem(this.coreValueText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8.0,
            ),
          ],
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(
            const Radius.circular(10.0),
          )),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: Text(
          coreValueText,
          style: Theme.of(context).textTheme.headline6,
        )),
        VerticalDivider(
          width: 7,
        ),
        FavouriteButton(coreValueText: coreValueText),
      ]),
    );
  }
}
