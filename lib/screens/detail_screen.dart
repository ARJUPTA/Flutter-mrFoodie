import 'package:flutter/material.dart';

import '../data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  final Function toggleFav;
  final Function isFav;
  MealDetailScreen(this.toggleFav, this.isFav);

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title, 
        style: Theme.of(context).textTheme.headline1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final mealDetails = MEALS.firstWhere((element) => element.id==mealID);

    return Scaffold(
      appBar: AppBar(title: Text(mealDetails.title),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: FadeInImage.assetNetwork(
                image: mealDetails.imageURL,
                placeholder: 'assets/thumbnail.png',
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context,'Ingredients'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              height: 200,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(mealDetails.ingredients[index]),
                    ),
                  );
                },
                itemCount: mealDetails.ingredients.length,
              )
            ),
            buildSectionTitle(context,'Steps'),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              height: 350,
              width: 300,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index+1}', 
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        title: Text(mealDetails.steps[index]),
                      ),
                      if(index!=mealDetails.steps.length-1) Divider(),
                    ],
                  );
                },
                itemCount: mealDetails.steps.length,
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Mark as favorite",
        child: isFav(mealID) 
          ? Icon(Icons.star)
          : Icon(Icons.star_border),
        onPressed: () {
          toggleFav(mealID);
        },
      ),
    );
  }
}