import 'package:flutter/material.dart';
import '../models/meal.dart';
import './drawer.dart';
import './categories_screen.dart';
import './favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favMeals;
  TabsScreen(this.favMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String,Object>> _pages = [];

  int _selectedPageIndex=0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex=index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'Categories', 
        'page': CategoriesScreen(),
      },
      {
        'title': 'Favorites', 
        'page': FavoritesScreen(widget.favMeals),
      },
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // return DefaultTabController(
    //     length: 2,
    //     // initialIndex: 0,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         title: Text('Mr. Foodie'),
    //         bottom: TabBar(
    //           tabs: [
    //             Tab(
    //               icon: Icon(Icons.category), 
    //               text: 'Categories',
    //             ),
    //             Tab(
    //               icon: Icon(Icons.star), 
    //               text: 'Favorites',
    //             ),
    //           ]
    //         ),
    //       ),
    //       body: TabBarView(children: [
    //         CategoriesScreen(),
    //         FavoritesScreen(),
    //       ]),
    //   ),
    // );
    return Scaffold(
      drawer: Drawer(
        child: AppDrawer(),
      ),
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title']),),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            // backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          )
        ],
      ),
    );
  }
}