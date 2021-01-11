import 'package:core_values/ui/core_value_list/empty_list_info.dart';
import 'package:core_values/ui/core_value_list/value_list_Item.dart';
import 'package:flutter/material.dart';

class CoreValueListWidget extends StatelessWidget {
  const CoreValueListWidget({
    Key key,
    @required this.coreValues, this.listName,
  }) : super(key: key);

  final List<String> coreValues;
  final String listName;

  @override
  Widget build(BuildContext context) {
    if(coreValues.isEmpty)
      return EmptyListInfo(listName: listName);
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(15,15, 15, 40),
      itemCount: coreValues.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) =>
          ValueListItem(coreValues.elementAt(index)),
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 10,
      ),
    );
  }
}
