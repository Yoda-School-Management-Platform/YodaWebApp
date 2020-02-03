import 'package:flutter/material.dart';
import 'package:yodawebapp/states/auth_state/auth_state.dart';
import 'package:yodawebapp/views/home/home_view.dart';
import 'package:yodawebapp/views/school/dashboard_view.dart';

class Presenter extends StatefulWidget {
  _Presenter createState() => _Presenter();
}

class _Presenter extends State<Presenter> implements AuthStateListener {

  BuildContext _ctx;

  _Presenter() {
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  Widget build(BuildContext context) {
    _ctx = context;
    return Container();



    /*return StreamBuilder(
      stream: authBloc.authState,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == AuthState.LOGGED_IN) {
          return SchoolDashboardView();
        } else {
          return HomeView();
        }
      },
    );*/
  }

  @override
  void onAuthStateChanged(AuthState state) {
    if(state == AuthState.LOGGED_IN)
      Navigator.of(_ctx).pushReplacementNamed("/home");
    else
      Navigator.of(_ctx).pushReplacementNamed("/home");
  }
}