import 'package:flutter/material.dart';

class AppBarIcons extends StatelessWidget {
  const AppBarIcons({super.key, required this.icon,  required this.funtion});

  final IconData icon;
  final VoidCallback funtion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: funtion,
        child: Container(
           decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(icon),
                ),
              ),
      ),
    );
    
  }
}