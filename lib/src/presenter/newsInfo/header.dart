import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/domain/entities/news.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget {
  final News news;
  const Header({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          width: double.infinity,
          child: Image.network(
            news.urlImage,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black54,
              ],
              stops: [0.95, 1.0],
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 18,
          child: SafeArea(
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 18,
          child: Text(
            '4 hour ago',
            style: GoogleFonts.inter(
              fontSize: 16,
              color: Color(0xFFEEEEEE),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
