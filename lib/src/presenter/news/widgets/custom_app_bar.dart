import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/presenter/news/widgets/categories_list.dart';
import 'package:flutter_news_app/src/presenter/news/widgets/search_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      titleSpacing: 0,
      leadingWidth: 0,
      toolbarHeight: 260,
      collapsedHeight: 280,
      expandedHeight: 300,
      elevation: 0,
      backgroundColor: Color(0xFFFFFFFF),
      title: Padding(
        padding: const EdgeInsets.only(left: 18, right: 18, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Discover',
              style: GoogleFonts.inter(
                fontSize: 42,
                color: Color(0xFF000000),
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'News from all over the world',
              style: GoogleFonts.inter(
                fontSize: 15.5,
                color: Color(0xFF999999),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SearchBar(),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        expandedTitleScale: 1.0,
        titlePadding: EdgeInsets.zero,
        title: CategoriesList(),
      ),
    );
  }
}
