import 'package:flutter/material.dart';
import 'package:mavis/pallete.dart';

class FeatureBox extends StatelessWidget {
  final String HeaderText;
  final String Description;
  final Color color;
  const FeatureBox({
  super.key, 
  required this.color, 
  required this.HeaderText,
  required this.Description
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              HeaderText,
              style: const TextStyle(
                fontFamily: 'Cera Pro',
                color: Pallete.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        
          const SizedBox(height: 3),
          Text(
            Description,
            style: const TextStyle(
              fontFamily: 'Cera Pro',
              color: Pallete.blackColor,
              fontSize: 14,
            ),
          ),
        ],
        ),
      ),
    );
  }
}
