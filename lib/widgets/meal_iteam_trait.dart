import 'package:flutter/material.dart';

class MealIteamTrait extends StatelessWidget {
  final IconData icon;
  final String label;
  const MealIteamTrait({super.key, required this.icon, required this.label});

  @override
  Widget build(Object context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white,),
        const SizedBox(width: 6,),
        Text(label, style: const TextStyle(color: Colors.white),)
      ],
    );
  }
}