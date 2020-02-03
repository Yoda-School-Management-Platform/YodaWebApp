import 'package:flutter/material.dart';
import 'package:yodawebapp/widgets/drawer/school_dashboard_drawer.dart';

class SchoolDashboardView extends StatelessWidget {
  const SchoolDashboardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SchoolDashboardDrawer(),
    );
  }
}
/*
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}*/