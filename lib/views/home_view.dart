import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_listview.dart';
import 'package:news_app/widgets/news_listview.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text("Cloud",
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold))
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers:[
            SliverToBoxAdapter(child: CategoryListview(),),
            NewsListview(category:"World"),
          ],
        ),
      ),
    );
  }
}
