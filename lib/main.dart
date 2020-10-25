import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/categories.dart';
import 'package:meals_app/pages/category_meals.dart';
import 'package:meals_app/pages/filter.dart';
import 'package:meals_app/pages/meal_detail.dart';
import 'package:meals_app/pages/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegetarian': false,
    'vegan': false
  };
  var _availableMeals = DUMMY_MEALS;
  List<Meal> favoritedMeals = [];

  void _toggleFavorite(String id){
    final existingId = favoritedMeals.indexWhere((element) => element.id == id);
    if(existingId >= 0){
      setState(() {
        favoritedMeals.removeAt(existingId);
      });
    }else{
      setState(() {
        favoritedMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool isMealFavorite(String id){
    return favoritedMeals.any((element) => element.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if(_filters['glutenFree'] && !element.isGlutenFree){
          return false;
        }
        if(_filters['lactoseFree'] && !element.isLactoseFree){
          return false;
        }
        if(_filters['vegetarian'] && !element.isVegetarian){
          return false;
        }
        if(_filters['vegan'] && !element.isVegan){
          return false;
        }
        return true;
      }).toList();
    });
  }

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
        Tabs.routeName: (ctx) => Tabs(favoritedMeals: favoritedMeals),
        CategoryMeals.routeName: (cxt) => CategoryMeals(availableMeals: _availableMeals),
        MealDetail.routeName: (context) => MealDetail(_toggleFavorite),
        Categories.routeName: (context) => Categories(),
        Filter.routeName: (context) => Filter(_setFilters, _filters)
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Categories());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => Categories());
      },
    );
  }
}
