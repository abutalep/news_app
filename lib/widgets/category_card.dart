import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/views/category_view.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
            return CategoryView(Category: category.categoryName,);}),
          );
        },
        child: Container(
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(category.categoryImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Text(category.categoryName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  shadows: [
                Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
                Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
                Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
                Shadow(offset: Offset(-1.5, 1.5), color: Colors.black),
              ],
                ),),
          ),
        ),
      ),
    );
  }
}
