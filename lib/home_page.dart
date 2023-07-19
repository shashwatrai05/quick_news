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
  List<Article>? article;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    article = await FetchNews().getNews();
    setState(() {
      isLoaded = true;
    });
  }

  Future<void> _refreshData() async {
    await getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick News'),
        backgroundColor: Colors.green.shade400,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: isLoaded
            ? ListView.separated(
                itemCount: article?.length ?? 0,
                itemBuilder: (context, index) {
                  final currentArticle = article![index];
                  return MyNews(
                    imageUrl: currentArticle.urlToImage,
                    title: currentArticle.title,
                    desc: currentArticle.description,
                    newsUrl: currentArticle.url,
                    content: currentArticle.content,
                    date: currentArticle.publishedAt,
                    author: currentArticle.author,
                  );
                },
                separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                  height: 1,
                );
              },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
