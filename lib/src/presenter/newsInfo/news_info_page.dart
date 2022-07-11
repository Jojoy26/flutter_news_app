import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:flutter_news_app/src/presenter/newsInfo/header.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsInfoPage extends StatelessWidget {
  final News news;
  const NewsInfoPage({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    Header(
                      news: news,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 24,
                        right: 24,
                      ),
                      child: Column(
                        children: [
                          Text(
                            news.title.trim(),
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.inter(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            news.content,
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              color: Color(0xFF999999),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
