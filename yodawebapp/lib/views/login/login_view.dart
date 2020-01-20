import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/color_palette.dart';

import 'package:yodawebapp/views/login/login_form.dart';


class LoginView extends StatefulWidget {
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Center(
          child: Container(
              height: 500,
              width: 500,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: DefaultTabController(
                  length: 3,
                  child: Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text('Login'),
                      leading: Container(),
                      backgroundColor: ColorPalette.darkGrey,
                      elevation: 0,
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.clear),
                          tooltip: 'Hide Login Dialog',
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                      bottom: TabBar(
                        indicatorColor: Colors.white,
                        tabs: [
                          Tab(
                            text: "Schüler",
                          ),
                          Tab(
                            text: "Lehrer",
                          ),
                          Tab(
                            text: "Schule",
                          ),
                        ],
                      ),
                      ),
                    body: TabBarView(
                      children: [
                        LoginForm(loginType: 'student'),
                        LoginForm(loginType: 'teacher'),
                        LoginForm(loginType: 'school'),
                      ],
                    ),
                  ),
                ),
              )),
        );
  }
}