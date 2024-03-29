import 'package:delimeals/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:delimeals/models/meal.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> favouriteMeals = [];
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favourites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(favouriteMeals[index]);
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
