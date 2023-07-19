import 'package:flutter/material.dart';
import 'package:quick_news/fetching/article.dart';
import 'package:quick_news/fetching/fetch.dart';
import 'package:quick_news/widget/news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Article? article;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    final fetchedArticle = await FetchNews.fetchNews();
    setState(() {
      article = fetchedArticle;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick News'),
        backgroundColor: Colors.green.shade400,
      ),
      body: isLoaded
          ? ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return News(
                  imageUrl: article!.urlToImage,
                  title: article!.title,
                  desc: article!.description,
                  newsUrl: article!.url,
                  content: article!.content,
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
