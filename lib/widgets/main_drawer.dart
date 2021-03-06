import 'package:flutter/material.dart';
import 'package:meals_app/pages/filter.dart';
import 'package:meals_app/pages/tabs.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up',
              style: TextStyle(
                  fontWeight: FontWeight.w900, fontSize: 30, color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 20),
          buildNavigationMenuItem(
              context: context,
              icon: Icons.restaurant,
              routeName: Tabs.routeName,
              title: 'Meals'),
          buildNavigationMenuItem(
            context: context,
            icon: Icons.settings,
            routeName: Filter.routeName,
            title: 'Filter'
          )
        ],
      ),
    );
  }

  ListTile buildNavigationMenuItem(
      {BuildContext context, IconData icon, String routeName, String title}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }
}
