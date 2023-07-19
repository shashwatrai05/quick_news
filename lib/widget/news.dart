import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class MyNews extends StatelessWidget {
  String imageUrl;
  String title;
  String desc;
  String newsUrl;
  String content;
  DateTime date;
  String author;
  MyNews(
    {
  required this.imageUrl,
  required this.title,
  required this.desc,
  required this.newsUrl,
  required this.content,
  required this.date,
  required this.author
  });

  void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}


  @override
  Widget build(BuildContext context) {
    return  Container(
           height: 300,
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: 135,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.5,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                 Expanded(
                  child: GestureDetector(
                    onTap: (){
                      _launchURL(newsUrl);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          desc,
        
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14),
                        ),

                        Text(
                          date.toString(),
                          //overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12,
                          color: Colors.blueAccent.shade400),
                        ),
                        Text(
                          author,
                          style: TextStyle(fontSize: 12,
                          color: Colors.red.shade500
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                
              ],

            ),

    ); 
        }
}