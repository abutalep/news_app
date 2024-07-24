// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/widgets/category_card.dart';

class CategoryListview extends StatelessWidget {
  const CategoryListview({super.key});
  final List<CategoryModel> categories = const [
    CategoryModel(categoryImage: "assets/top.jpg", categoryName: "Top"),
    CategoryModel(
        categoryImage: "assets/entertaiment.avif",
        categoryName: "EnterTainment"),
    CategoryModel(categoryImage: "assets/world.jpg", categoryName: "World"),
    CategoryModel(categoryImage: "assets/health.avif", categoryName: "Health"),
    CategoryModel(
        categoryImage: "assets/science.avif", categoryName: "Science"),
    CategoryModel(categoryImage: "assets/sports.avif", categoryName: "Sports"),
    CategoryModel(
        categoryImage: "assets/business.avif", categoryName: "Business"),
    CategoryModel(
        categoryImage: "assets/technology.jpeg", categoryName: "Technology"),
    CategoryModel(categoryImage: "assets/crime.jpg", categoryName: "Crime"),
    CategoryModel(
        categoryImage: "assets/domestic.jpg", categoryName: "Domestic"),
    CategoryModel(
        categoryImage: "assets/education.jpg", categoryName: "Education"),
    CategoryModel(
        categoryImage: "assets/environment.jpg", categoryName: "Environment"),
    CategoryModel(categoryImage: "assets/food.jpg", categoryName: "Food"),
    CategoryModel(
        categoryImage: "assets/lifestyle.jpg", categoryName: "LifeStyle"),
    CategoryModel(categoryImage: "assets/tourism.jpg", categoryName: "Tourism"),
    CategoryModel(
        categoryImage: "assets/politics.jpg", categoryName: "Politics"),
    CategoryModel(categoryImage: "assets/other.jpg", categoryName: "Other"),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 28),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          },
        ),
      ),
    );
  }
}
