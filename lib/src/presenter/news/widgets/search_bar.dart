import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/src/presenter/news/news_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<NewsController>();

    return TextField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: GoogleFonts.inter(
          fontSize: 18,
          color: Color(0xFFBBBBBB),
        ),
        filled: true,
        fillColor: Color(0xFFF9F9F9),
        prefixIcon: Icon(
          Icons.search,
          size: 27,
          color: Color(0xFFBBBBBB),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      onChanged: (String text) {
        controller.search.value = text;
      },
      onSubmitted: (String text) {
        print('Submitted');
        controller.getNewsBySearch();
      },
    );
  }
}
