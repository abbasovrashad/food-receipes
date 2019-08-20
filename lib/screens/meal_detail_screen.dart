import 'package:delimeals/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:delimeals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function _toggleFunction;
  final Function _isMealFavourite;
  MealDetailScreen(this._toggleFunction, this._isMealFavourite);
  static const routeName = 'meal-detail';
  Widget buildSectionWidget(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionWidget(context, 'Ingredients'),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(ctx).accentColor,
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text('${selectedMeal.ingredients[index]}')),
              ),
            )),
            buildSectionWidget(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                  ),
                  Divider()
                ]),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isMealFavourite(mealId) ? Icons.star : Icons.star_border),
        onPressed: ()=>_toggleFunction(mealId),
      ),
    );
  }
}
