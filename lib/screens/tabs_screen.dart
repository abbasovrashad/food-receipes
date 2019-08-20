import 'package:delimeals/widgets/main_drawer.dart';

import './favourites_screen.dart';
import 'package:delimeals/models/meal.dart';
import 'categories_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeals = [];
  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavouritesScreen(widget.favouriteMeals), 'title': 'Favourites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_pages[_selectedPage]['title']}'),
      ),
      body: _pages[_selectedPage]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPage,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text(
                'Categories',
              )),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.favorite,
            ),
            title: Text('Favourites'),
          ),
        ],
      ),
    );
  }
}
