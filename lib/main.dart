import 'package:flutter/material.dart';

import './data.dart';
import 'models/meal.dart';
import 'screens/about_screen.dart';
import 'screens/filter_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availMeals = MEALS;
  List<Meal> _favMeals = [];

  Map<String,bool> _filters = {
    'hasegg': true,
    'isveg': false,
    'isvegan': false,
    'issugarfree': false,
  };

  void changeFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;
      _availMeals = MEALS.where((element) {
        if(_filters['hasegg'] && !element.hasEgg)
          return false;
        if(_filters['isveg'] && !element.isVegetarian)
          return false;
        if(_filters['isvegan'] && !element.isVegan)
          return false;
        if(_filters['issugarfree'] && !element.isSugarFree)
          return false;

        return true;
      }).toList();
    });
  }

  void _toggleFavs(String mealID) {
    final index = _favMeals.indexWhere((element) => element.id == mealID);
    if(index==-1)
      setState(() {
        _favMeals.add(MEALS.firstWhere((element) => element.id == mealID));
      });
    else
      setState(() {
        _favMeals.removeAt(index);
      });
  }

  bool _isFavorite(String mealID) {
    return _favMeals.any((element) => element.id == mealID);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mr Foodie',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.orangeAccent,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed',
          ) 
        )
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favMeals),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(_availMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavs, _isFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filters, changeFilters),
        AboutScreen.routeName: (ctx) => AboutScreen(),
      },
      //If page not found
      onUnknownRoute: (_) {
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: Text('Page not found')),
              body: Center(
                child: Text("404! Page not found."),
              )
            );
           }
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mr Foodie'),
      ),
      body: Center(
        child: Text('Mr Foodie'),
      ),
    );
  }
}
