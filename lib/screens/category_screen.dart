import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoryScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  const CategoryScreen({super.key, required this.onToggleFavourite, required this.availableMeals});

  void _selectCategory(BuildContext context, Category category) {
    final categoryMeals = availableMeals.where((meal) => meal.categories.contains(category.id)).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealScreen(title: category.title, meals: categoryMeals, onToggleFavourite: onToggleFavourite,)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 3/2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        children: [
          for(final category in availableCategories)
            CategoryGridItem(category: category, onSelectCategory: () {_selectCategory(context, category);},)
        ],
      ),
    );
  }
  
}