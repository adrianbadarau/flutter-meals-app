import 'package:flutter/material.dart';
import 'package:meals_app/pages/categories.dart';
import 'package:meals_app/pages/category_meals.dart';
import 'package:meals_app/pages/favorites.dart';
import 'package:meals_app/pages/filter.dart';
import 'package:meals_app/pages/meal_detail.dart';
import 'package:meals_app/pages/tabs.dart';

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
        Tabs.routeName: (ctx) => Tabs(),
        CategoryMeals.routeName: (cxt) => CategoryMeals(),
        MealDetail.routeName: (context) => MealDetail(),
        Favorites.routeName: (context) => Favorites(),
        Categories.routeName: (context) => Categories(),
        Filter.routeName: (context) => Filter()
      },
      onGenerateRoute: (settings){
        return MaterialPageRoute(
          builder: (context) => Categories()
        );
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(
          builder: (context) => Categories()
        );
      },
    );
  }
}
