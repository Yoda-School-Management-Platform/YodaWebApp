import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/routes.dart';
import 'package:yodawebapp/view_presenter/view_presenter.dart';
import 'package:yodawebapp/views/home/home_view.dart';
import 'package:yodawebapp/views/school/dashboard_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
    );
  }
}