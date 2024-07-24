// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class NewItem extends StatelessWidget {
  ArticleModel article;
  NewItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: article.image != null
                ? CachedNetworkImage(
                    imageUrl: article.image!,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                : Image.asset(
                    "assets/world.jpg",
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            article.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            article.subTitle ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
