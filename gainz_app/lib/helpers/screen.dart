import 'package:flutter/widgets.dart';

class Screen {
  dynamic widget;
  String appBarTitle;
  String navBarText;
  Icon icon;

  Screen(dynamic _widget, String _appBarTitle, String _navBarText, Icon _icon) {
    widget = _widget;
    appBarTitle = _appBarTitle;
    navBarText = _navBarText;
    icon = _icon;
  }
}
