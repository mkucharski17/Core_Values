import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentTabIndex;
  final VoidCallback onTap;

  const TopBar({Key key, this.currentTabIndex, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(Icons.notes),
            onPressed: () => {AppSettings.openDisplaySettings()})
      ],
      leading: currentTabIndex != 1
          ? InkWell(
              child: Icon(Icons.arrow_back),
              onTap: onTap,
            )
          : null,
      title: Text(getTitleByPageIndex(currentTabIndex)),
    );
  }

  String getTitleByPageIndex(int index) {
    switch (index) {
      case 0:
        return 'Values';
        break;
      case 2:
        return 'Favourites';
        break;
      default:
        return 'NG Values';
    }
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
