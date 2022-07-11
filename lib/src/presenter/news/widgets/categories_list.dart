import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_news_app/src/presenter/models/category_model.dart';
import 'package:flutter_news_app/src/presenter/news/news_controller.dart';
import 'package:flutter_news_app/src/presenter/utils/categories_list.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<NewsController>();

    return Container(
      height: 43,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 18, right: 18),
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          CategoryModel category = categoryList[index];
          return InkWell(
            onTap: () {
              controller.onCategoryPress(index);
            },
            child: Column(
              children: [
                Obx(
                  () => Text(
                    category.categoryDisplayName,
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      color: controller.selectedCategoryNumber.value == index
                          ? Color(0xFF111111)
                          : Color(0xFFCCCCCC),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Obx(
                  () => Container(
                    height: 2,
                    color: controller.selectedCategoryNumber.value == index
                        ? Color(0xFF111111)
                        : Color(0xFFCCCCCC),
                    width: (17.5 * category.categoryDisplayName.length),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
