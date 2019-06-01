import 'package:flutter/material.dart';
import 'package:beam_me/services/authentication.dart';
import 'package:beam_me/screens/auth/login_signup.dart';
import 'package:beam_me/screens/home/homepage.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_LOGGED_IN;
  String _userId = "";

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
        user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
  }

  void _onLoggedIn() {
    widget.auth.getCurrentUser().then((user){
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;

    });
  }

  void _onSignedOut() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_LOGGED_IN:
        return new LoginSignupPage(
          auth: widget.auth,
          onSignedIn: _onLoggedIn,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userId.length > 0 && _userId != null) {
          return new HomePage(
            userId: _userId,
            auth: widget.auth,
            onSignedOut: _onSignedOut,
          );
        }
        break;
      default:
        return new LoginSignupPage(
          auth: widget.auth,
          onSignedIn: _onLoggedIn,
        );
    }
  }
}