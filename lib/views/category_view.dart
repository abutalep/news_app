import 'package:flutter/material.dart';
import 'package:news_app/widgets/news_listview.dart';

class CategoryView extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Category;
  // ignore: non_constant_identifier_names
  const CategoryView({super.key,required this.Category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right:54.0),
            child: Text(Category,style:const TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            NewsListview(category: Category),
          ],
        ),
      ),
    );
  }
}
