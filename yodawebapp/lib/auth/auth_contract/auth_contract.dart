
import 'package:yodawebapp/auth/auth_state/auth_state.dart';

abstract class AuthContract implements AuthStateListener{
  initState() {
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }
}