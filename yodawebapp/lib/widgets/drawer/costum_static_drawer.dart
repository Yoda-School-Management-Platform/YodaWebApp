import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yodawebapp/utils/color_palette.dart';

import 'package:yodawebapp/utils/items/drawer_item.dart';
import 'package:yodawebapp/views/home/home_view.dart';

class StandardDrawer extends StatefulWidget {

  final List<DrawerItem> items;

  const StandardDrawer({Key key, this.items}) : super(key: key);

  _StandardDrawer createState() => _StandardDrawer();
}

class _StandardDrawer extends State<StandardDrawer> {

  Widget currentPage = HomeView();

  Widget build (BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 250,
          color: ColorPalette.darkGrey,
          child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: widget.items.length,
              itemBuilder: (itemcontext, itemposition) {
                return ListTile(
                    title: Text(widget.items[itemposition].title, style:  TextStyle(color: ColorPalette.pinkPurple, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    onTap: () {
                      setState(() {
                        currentPage = widget.items[itemposition].route;
                      });
                    }
                );
              }),
        ),
        Expanded(
          child: currentPage,
        )
      ],
    );
  }
}