import 'package:flutter/material.dart';
import 'package:yodawebapp/view_presenter/view_presenter.dart';
import 'package:yodawebapp/views/home/home_view.dart';
import 'package:yodawebapp/views/loading/loading_view.dart';
import 'package:yodawebapp/views/registration/registration_view.dart';
import 'package:yodawebapp/views/school/dashboard_view.dart';

final routes = {
  '/':    (BuildContext context) => new Presenter(),
  '/loading':     (BuildContext context) => new Loading(),
  '/home':        (BuildContext context) => new HomeView(),
  '/register':    (BuildContext context) => new RegistrationView(),
  '/school':    (BuildContext context) => new SchoolDashboardView(),
  '/student':    (BuildContext context) => new StudentDashboardView(),
  '/teacher':    (BuildContext context) => new TeacherDashboardView(),
};