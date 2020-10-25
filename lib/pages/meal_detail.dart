import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final selectedMeal = DUMMY_MEALS.firstWhere(
        (element) => element.id == ModalRoute.of(context).settings.arguments);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(selectedMeal.ingredients[index]));
              },
            )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (context, index) => Column(children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(selectedMeal.steps[index]),
                ),
                Divider()
              ]),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: (){
          Navigator.of(context).pop(selectedMeal.id);
        },
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      width: 300,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: child,
    );
  }

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
