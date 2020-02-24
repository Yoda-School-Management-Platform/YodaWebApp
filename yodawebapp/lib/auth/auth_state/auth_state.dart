
import 'dart:html';

enum AuthState{LOGGED_IN, LOGGED_OUT}


abstract class AuthStateListener {
  void onAuthStateChanged(AuthState state);
}

// A naive implementation of Observer/Subscriber Pattern. Will do for now.
class AuthStateProvider {
  static final AuthStateProvider _instance = new AuthStateProvider.internal();

  List<AuthStateListener> _subscribers = [];

  factory AuthStateProvider() => _instance;
  AuthStateProvider.internal() {
    //_subscribers = new List<AuthStateListener>();
    initState();
  }

  void initState() async {
    if(window.localStorage.containsValue('auth') != null)
      notify(AuthState.LOGGED_IN);
    else
      notify(AuthState.LOGGED_OUT);
  }

  void subscribe(AuthStateListener listener) {
    _subscribers.add(listener);
    print("Never called" +  _subscribers.length.toString());
  }

  void dispose(AuthStateListener listener) {
    for(var l in _subscribers) {
      if(l == listener)
        _subscribers.remove(l);
    }
  }

  void notify(AuthState state) {
    print("Elias mag fisch" + _subscribers.length.toString());
    //_subscribers.forEach((AuthStateListener s) => s.onAuthStateChanged(state));
    _subscribers.forEach((AuthStateListener s) {s.onAuthStateChanged(state);
    print('auth stated');
    });
  }
}