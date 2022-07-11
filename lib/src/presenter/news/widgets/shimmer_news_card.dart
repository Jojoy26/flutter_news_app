// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_news_app/src/presenter/news/widgets/shimmer.dart';

class ShimmerNewsCard extends StatelessWidget {
  const ShimmerNewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        children: [
          ShimmerEffect(
            child: Container(
              clipBehavior: Clip.antiAlias,
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
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
                children: [
                  ShimmerEffect(
                    child: Container(
                      color: Colors.white,
                      height: 50,
                      width: double.infinity,
                    ),
                  ),
                  ShimmerEffect(
                    child: Container(
                      color: Colors.white,
                      height: 14,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
