class Article {
 //Source source;
    //Author author;
    String title;
    String description;
    String url;
    String urlToImage;
    //DateTime publishedAt;
    String content;

 Article(
      {//required this.source,
        //required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        //required this.publishedAt,
        required this.content,});

 static Article fromAPItoApp(Map<String, dynamic> article) {
    return Article(
      //source: Source.fromJson(json["source"]),
       // author: authorValues.map[json["author"]]!,
        urlToImage: article["urlToImage"] ?? "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
        content: article["content"] ?? "--",
        description: article["description"] ?? "--",
        title: article["title"]  ?? "--",
        //publishedAt: DateTime.parse(json["publishedAt"]),
        url: article["url"] ?? "https://news.google.com/topstories?hl=en-IN&gl=IN&ceid=IN:en");
  }
}



