import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/category_screen.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

Map<Filter, bool> kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});
  
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      )
    );
  }

  void toggleMealFavouriteState(Meal meal) {
    final isExisting = _favouriteMeals.contains(meal);
    setState(() {
      ScaffoldMessenger.of(context).clearSnackBars();
      if(isExisting) {
        _favouriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer a favourite!');
      }
      else {
        _favouriteMeals.add(meal);
        _showInfoMessage('Marked as favourite!');
      }
    });
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _onSelectScreen(String identifier) async {
    Navigator.of(context).pop();
    if(identifier == 'filters') {
      final result = await Navigator.push<Map<Filter, bool>>(
        context, 
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(selectedFilters: _selectedFilters,)
        )
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((meal) {
      if(_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if(_selectedFilters[Filter.vegan]! && !meal.isGlutenFree) {
        return false;
      } 
      if(_selectedFilters[Filter.vegetarian]! && !meal.isGlutenFree) {
        return false;
      } 
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isGlutenFree) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoryScreen(onToggleFavourite: toggleMealFavouriteState, availableMeals: availableMeals,);
    String activePageTitle = 'Pick your Categories';

    if(_selectedPageIndex == 1) {
      activePage = MealScreen(meals: _favouriteMeals, onToggleFavourite: toggleMealFavouriteState,);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _onSelectScreen,),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star) , label: 'Favourites')
        ],
      ),
      body: activePage,
    );
  }
}