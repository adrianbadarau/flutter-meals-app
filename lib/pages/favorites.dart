import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class Favorites extends StatelessWidget {
  static const routeName = '/favorites';
  final List<Meal> favorites;

  Favorites(this.favorites);

  @override
  Widget build(BuildContext context) {
    if(favorites.isEmpty){
      return Container(
        child: Text('You have no favorites yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          var meal = favorites[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
          );
        },
        itemCount: favorites.length,
      );
    }

  }
}
