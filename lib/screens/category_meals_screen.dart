import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availMeals;
  CategoryMealScreen(this.availMeals);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,Object>;
    final String categoryTitle=routeArgs['title'];
    final String categoryID=routeArgs['id'];
    final Color categoryColor=routeArgs['color'];
    final categoryMeals = widget.availMeals.where((element) => element.categories.contains(categoryID)).toList();

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle), backgroundColor: categoryColor,),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageURL: categoryMeals[index].imageURL,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            duration: categoryMeals[index].duration,
          );
        },
        itemCount: categoryMeals.length,
      ),
      floatingActionButton: Builder(
        builder: (BuildContext ctx) {
          return FloatingActionButton(
            backgroundColor: categoryColor,
            tooltip: "Add Meals",
            child: Icon(Icons.add),
            onPressed: () {
              Scaffold.of(ctx).showSnackBar(SnackBar(
                content: Text("Non-functional for now!", style: TextStyle(color: Colors.black)),
                backgroundColor: Color.fromRGBO(232, 190, 49, 1),
                duration: Duration(seconds: 5),
                action: SnackBarAction(
                  label: "OK", 
                  onPressed: () {},
                  textColor: Colors.black,
                ),
              ));
            }
          );
        },
      ),
    );
  }
}