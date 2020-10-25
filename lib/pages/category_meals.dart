import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  @override
  _CategoryMealsState createState() => _CategoryMealsState();

  CategoryMeals({this.availableMeals});
}

class _CategoryMealsState extends State<CategoryMeals> {
  Map<String, String> routeArgs;
  List<Meal> categoryMeals;
  var loadedInitData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var meal = categoryMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
            imageUrl: meal.imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    if (!loadedInitData) {
      routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryMeals = widget.availableMeals
          .where((element) => element.categories.contains(routeArgs['id']))
          .toList();
      loadedInitData = true;
    }
    super.didChangeDependencies();
  }
}
