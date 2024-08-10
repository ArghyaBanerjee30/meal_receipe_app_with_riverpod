import 'package:flutter/material.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  final Map<Filter, bool> selectedFilters;

  const FiltersScreen({super.key, required this.selectedFilters});

  @override
  State<FiltersScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _veganFilterSet = false;
  var _vegFilterSet = false;
  var _lactoseFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.selectedFilters[Filter.glutenFree]!;
    _veganFilterSet = widget.selectedFilters[Filter.vegan]!;
    _vegFilterSet = widget.selectedFilters[Filter.vegetarian]!;
    _lactoseFreeFilterSet = widget.selectedFilters[Filter.lactoseFree]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),

      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if(didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegFilterSet,
            Filter.vegan: _veganFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet, 
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              }, 
              title: Text('Gluten-Free', 
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Gluten Free Meals!', 
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: _veganFilterSet, 
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterSet = isChecked;
                });
              }, 
              title: Text('Vegan', 
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Vegan Meals!', 
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: _vegFilterSet, 
              onChanged: (isChecked) {
                setState(() {
                  _vegFilterSet = isChecked;
                });
              }, 
              title: Text('Vegetarian', 
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Vegetarian Meals!', 
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
        
            SwitchListTile(
              value: _lactoseFreeFilterSet, 
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              }, 
              title: Text('Lactose-Free', 
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              subtitle: Text(
                'Only include Lactose Free Meals!', 
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}