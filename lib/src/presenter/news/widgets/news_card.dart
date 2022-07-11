import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/presenter/newsInfo/news_info_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:jiffy/jiffy.dart';

class NewsCard extends StatelessWidget {
  final News news;
  const NewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NewsInfoPage(
              news: news,
            ),
          ),
        );
      },
      child: Container(
        height: 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                news.urlImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.title.length > 35
                          ? '${news.title.trim().substring(0, 35)}...'
                          : news.title,
                      overflow: TextOverflow.clip,
                      style: GoogleFonts.inter(
                        height: 1.35,
                        fontSize: 19,
                        color: Color(0xFF101010),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_sharp,
                          color: Color(0xFFBCBCBC),
                          size: 18,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${Jiffy(news.publishedAt).fromNow()}',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Color(0xFFBCBCBC),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
