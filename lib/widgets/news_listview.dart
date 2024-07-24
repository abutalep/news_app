import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/new_item.dart';

class NewsListview extends StatefulWidget {
  final String category;
  const NewsListview({super.key,required this.category});

  @override
  // ignore: no_logic_in_create_state
  State<NewsListview> createState() => _NewsListviewState(Category:category);
}

class _NewsListviewState extends State<NewsListview> {
  // ignore: non_constant_identifier_names
  final String Category;
  // ignore: prefer_typing_uninitialized_variables
  var future;
  // ignore: non_constant_identifier_names
  _NewsListviewState({required this.Category});
  @override
  void initState() {
    super.initState();
    future = NewsService().getNews(Category); // Call the separate method
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()))
              : snapshot.hasData && snapshot.data!.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: snapshot.data!.length,
                        (context, index) {
                          return NewItem(article: snapshot.data![index]);
                        },
                      ),
                    )
                  : const SliverFillRemaining(
                      child: Center(
                        child: Text(
                          "OPPS!",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
        });
  }
}

// import 'package:flutter/material.dart';
// import 'package:news_app/models/article_model.dart';
// import 'package:news_app/services/news_service.dart';
// import 'package:news_app/widgets/new_item.dart';

// class NewsListview extends StatefulWidget {
//   NewsListview({super.key});

//   @override
//   State<NewsListview> createState() => _NewsListviewState();
// }

// class _NewsListviewState extends State<NewsListview> {
//   List<ArticleModel> articles = [];
//   bool isLoading = true;
//   @override
//   void initState() {
//     super.initState();
//     GeneralNews(); // Call the separate method
//   }

//   Future<void> GeneralNews() async {
//     articles = await NewsService().getNews("general");
//     isLoading = false;
//     setState(() {}); // Update the UI after fetching data
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
//         : articles.isNotEmpty
//             ? SliverList(
//                 delegate: SliverChildBuilderDelegate(
//                   childCount: articles.length,
//                   (context, index) {
//                     return NewItem(article: articles[index]);
//                   },
//                 ),
//               )
//             : SliverFillRemaining(
//                 child: Center(
//                   child: Text(
//                     "OPPS!",
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               );
//   }
// }
