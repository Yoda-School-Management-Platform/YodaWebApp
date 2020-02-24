import 'package:flutter/material.dart';
import 'package:yodawebapp/auth/auth_contract/auth_contract.dart';
import 'package:yodawebapp/auth/auth_state/auth_state.dart';
import 'package:yodawebapp/views/home/home_view.dart';
import 'package:yodawebapp/views/school/dashboard_view.dart';

class Presenter extends StatefulWidget {
  _Presenter createState() => _Presenter();
}

class _Presenter extends State<Presenter> implements AuthStateListener, AuthContract {

 void initState() {
    super.initState();
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  BuildContext _ctx;

  Widget build(BuildContext context) {
    _ctx = context;
    return HomeView();
  }

  @override
  void onAuthStateChanged(AuthState state) {
    print('AuthState Changed');
    if(state == AuthState.LOGGED_IN)
      Navigator.of(_ctx).pushReplacementNamed("/school");
    else
      Navigator.of(_ctx).pushReplacementNamed("/home");
  }
}