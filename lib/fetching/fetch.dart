import 'article.dart';
import 'dart:math';

import 'package:http/http.dart' ;
import 'dart:convert';
class FetchNews{
  static List sourcesId = [
    "abc-news",
 
    "bbc-news",
    "bbc-sport",

    "business-insider",

    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
   
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",

    "medical-news-today",
    
    "national-geographic",
 
    "news24",
    "new-scientist",
   
    "new-york-magazine",
    "next-big-future",
  
    "techcrunch",
    "techradar",
   
    "the-hindu",
   
    "the-wall-street-journal",
    
    "the-washington-times",
    "time",
    "usa-today",
    
  ];
  /*

  static fetchnews() async{
    final _random = new Random();
    var sourceId = sourcesId[_random.nextInt(sourcesId.length)];
    print(sourceId);
   var uri=Uri.parse('https://newsapi.org/v2/top-headlines?sources=$sourceId&apiKey=e1d7500d0fb646c0840553266e7a7ff4');
   Response response=await get(uri);
   if(response.statusCode==200){
    Map body_data= jsonDecode(response.body);
    List articles= body_data["articles"];
    //print(articles);

    final _Newrandom = new Random();
    var myArticle = articles[_Newrandom.nextInt(articles.length)];
    print(myArticle);
    Article.fromAPItoApp(myArticle);

   }
  }
  }
  */
  static Future<Article> fetchNews() async {
    final _random = new Random();
    var sourceID = sourcesId[_random.nextInt(sourcesId.length)];
   
    Response response = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$sourceID&apiKey=caea254bf2f94f869e831ec24284ece1"));

    Map body_data = jsonDecode(response.body);
    List articles = body_data["articles"];
  
    final _Newrandom = new Random();
    var myArticle = articles[_Newrandom.nextInt(articles.length)];
 print(myArticle);

    return Article.fromAPItoApp(myArticle);
  }
}