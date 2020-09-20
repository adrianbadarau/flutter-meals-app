import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  //
  // CategoryMeals({this.categoryId, this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
    return Scaffold(
        appBar: AppBar(
        title: Text(routeArgs['title']),
    ),
    body: Center(
    child: Text('The recipes for category ${routeArgs['title']}'),
    )
    ,
    );
  }
}
