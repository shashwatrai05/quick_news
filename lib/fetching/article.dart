// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
    String status;
    int totalResults;
    List<Article> articles;

    News({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory News.fromJson(Map<String, dynamic> json) => News(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
    };
}

class Article {
    //Source source;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    Article({
        //required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        //source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'Unknown',
        title: json["title"] ?? 'News Headline',
        description: json["description"]?? '-----',
        url: json["url"] ?? 'https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en',
        urlToImage: json["urlToImage"] ?? 'https://cdn.dribbble.com/users/1730190/screenshots/15750176/media/f5fda9616439f11ae30a721dc5fcb9b2.png?resize=400x0',
        publishedAt: DateTime.parse(json["publishedAt"] ?? 'XX-XX-XXXX',) ,
        content: json["content"] ?? '--',
    );

    Map<String, dynamic> toJson() => {
        //"source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
    };
}
/*
enum Author { BBC_NEWS }

final authorValues = EnumValues({
    "BBC News": Author.BBC_NEWS
});

class Source {
    Id id;
    Author name;

    Source({
        required this.id,
        required this.name,
    });

    factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: idValues.map[json["id"]]!,
        name: authorValues.map[json["name"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": authorValues.reverse[name],
    };
}

enum Id { BBC_NEWS }

final idValues = EnumValues({
    "bbc-news": Id.BBC_NEWS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
    
}
*/
