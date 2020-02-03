import 'package:flutter/material.dart';
import 'package:yodawebapp/views/home/home_view.dart';
import 'package:yodawebapp/views/loading/loading_view.dart';
import 'package:yodawebapp/views/registration/registration_view.dart';

import 'package:yodawebapp/widgets/drawer/costum_static_drawer.dart';
import 'package:yodawebapp/utils/items/drawer_item.dart';

class SchoolDashboardDrawer extends StatelessWidget {

  final List<DrawerItem> items = [
    DrawerItem('Home', HomeView()),
    DrawerItem('Register', Loading()),
  ];

  Widget build(BuildContext context) {
    return StandardDrawer(items: items);
  }
}