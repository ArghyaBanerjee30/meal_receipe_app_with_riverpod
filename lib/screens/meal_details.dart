import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;

  const MealDetailsScreen({super.key, required this.meal, required this.onToggleFavourite});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {onToggleFavourite(meal);}, 
            icon: const Icon(Icons.star)
          )
        ]
      ),
      body: ListView(
        children: [
          Image.network(meal.imageUrl, width: double.infinity, height: 300, fit: BoxFit.cover,),
          const SizedBox(height: 14,),
          Text('Ingredients', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          const SizedBox(height: 14,),
          for(final ingredient in meal.ingredients) 
            Text(ingredient, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground), textAlign: TextAlign.center,),
          const SizedBox(height: 24,),
          Text('Steps', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          const SizedBox(height: 14,),
          for(final step in meal.steps) 
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(step, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onBackground), textAlign: TextAlign.center,),
            )
        ],
      ),
    );
  }

}