import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: CATEGORIES.map((data) {
        return CategoryItem(
          id: data.id,
          title: data.title, 
          color: data.color
        );
      }).toList(),
    );
  }
}