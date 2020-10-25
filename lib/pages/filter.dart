import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class Filter extends StatelessWidget {
  static const routeName = '/filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('filter'),
      ),
    );
  }
}
