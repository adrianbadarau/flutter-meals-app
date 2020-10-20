import 'package:flutter/material.dart';
import 'package:meals_app/pages/categories.dart';
import 'package:meals_app/pages/category_meals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.cyanAccent,
        canvasColor: Colors.blueGrey[100],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            headline6: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed')),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        Categories.routeName: (ctx) => Categories(),
        CategoryMeals.routeName: (cxt) => CategoryMeals()
      },
    );
  }
}
