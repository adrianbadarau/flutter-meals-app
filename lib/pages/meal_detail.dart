import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final meal = DUMMY_MEALS.firstWhere((element) =>
    element.id == ModalRoute
        .of(context)
        .settings
        .arguments as String);
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: Center(
        child: Text('${meal.title}'),
      ),
    );
  }
}
