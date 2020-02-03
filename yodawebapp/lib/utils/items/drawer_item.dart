

import 'package:flutter/cupertino.dart';

class DrawerItem {
  final String _title;
  final Widget _route;

  DrawerItem(this._title, this._route);

  String get title => _title;
  Widget get route => _route;

}