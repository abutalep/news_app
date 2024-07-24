class ArticleModel {
  final String? image, title, subTitle;
  ArticleModel(
      {required this.image, required this.title, required this.subTitle});
  factory ArticleModel.formjson(json){
    return ArticleModel(
      image: json['image_url'],
      title: json['title'],
      subTitle: json['description'],
    );
  }
}
