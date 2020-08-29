import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (_favoriteMeals.isEmpty) 
        ? Text(
          'You have no favourites yet - start adding some.', 
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        )
        : ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: _favoriteMeals[index].id,
              title: _favoriteMeals[index].title,
              imageURL: _favoriteMeals[index].imageURL,
              duration: _favoriteMeals[index].duration,
              affordability: _favoriteMeals[index].affordability,
              complexity: _favoriteMeals[index].complexity,
            );
          },
          itemCount: _favoriteMeals.length,
        ) 
    );
  }
}