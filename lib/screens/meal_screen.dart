import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_items.dart';

class MealScreen extends StatelessWidget {
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavourite;

  const MealScreen({super.key, this.title, required this.meals, required this.onToggleFavourite});

  void onSelectItem(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(meal: meal, onToggleFavourite: onToggleFavourite,)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Uh oh ... Nothing here!!!", style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),),
            const SizedBox(height: 16,),
            Text("Try selecting a Different Cattegory", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground
            ),)
          ],
        ),
      );

    if(meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItems(meal: meals[index], onSelectItem: (meal) {onSelectItem(context, meal);},),
      );
    }

    if(title == null ) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
  
}