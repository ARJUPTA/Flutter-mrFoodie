import 'package:flutter/foundation.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard,
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageURL;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity; 
  final Affordability affordability;
  final bool isVegetarian;
  final bool isVegan;
  final bool hasEgg;
  final bool isSugarFree;

  const Meal({
    @required this.id, 
    @required this.categories, 
    @required this.title, 
    @required this.imageURL, 
    @required this.ingredients, 
    @required this.steps, 
    @required this.duration, 
    @required this.complexity, 
    @required this.affordability, 
    @required this.isVegetarian, 
    @required this.isVegan, 
    @required this.hasEgg,
    @required this.isSugarFree,
  });
}