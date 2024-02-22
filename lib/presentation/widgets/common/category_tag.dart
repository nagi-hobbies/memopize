import 'package:flutter/material.dart';
import 'package:memopize/domain/types/consts_category.dart';

class CategoryTag extends StatelessWidget {
  const CategoryTag({super.key, required this.category});
  final ConstsCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 1, bottom: 1),
      decoration: BoxDecoration(
          color: category.color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Text(category.name,
          style: TextStyle(
              fontSize: 10,
              color: category.color,
              fontWeight: FontWeight.bold)),
    );
  }
}
