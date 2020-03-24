import 'dart:html';

import 'package:flutter/material.dart';
import 'package:yodawebapp/auth/auth_state/auth_state.dart';
import 'package:yodawebapp/utils/color_palette.dart';

import 'package:yodawebapp/utils/items/drawer_item.dart';
import 'package:yodawebapp/views/home/home_view.dart';
import 'package:yodawebapp/views/loading/loading_view.dart';
import 'package:yodawebapp/widgets/drawer/personal_dashboard_area.dart';

class StandardDrawer extends StatefulWidget {
  final List<DrawerItem> items;

  const StandardDrawer({Key key, this.items}) : super(key: key);

  _StandardDrawer createState() => _StandardDrawer();
}

class _StandardDrawer extends State<StandardDrawer> {

  final auth = AuthStateProvider();
  Widget currentPage = Loading();

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.local_gas_station),
        onPressed: () {
          print('called');
          auth.notify(AuthState.LOGGED_OUT);
          window.localStorage.remove('auth');
        },
      ),
      body: Row(
        children: <Widget>[
          Container(
            width: 250,
            color: ColorPalette.darkGrey,
            child: Column(
              children: <Widget>[
                PersonalDashboardArea(),
                ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: widget.items.length,
                    itemBuilder: (itemcontext, itemposition) {
                      return ListTile(
                          title: Column(
                            children: <Widget>[
                              Icon(Icons.person, color: ColorPalette.pinkPurple, size: 30,),
                              Text(
                                widget.items[itemposition].title,
                                style: TextStyle(
                                    color: ColorPalette.pinkPurple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          onTap: () {
                            setState(() {
                              currentPage = widget.items[itemposition].route;
                            });
                          });
                    })
              ],
            ),
          ),
          Flexible(
            child: currentPage,
          )
        ],
      ),
    );
  }
}

