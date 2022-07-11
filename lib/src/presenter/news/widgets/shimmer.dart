// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final Widget child;
  const ShimmerEffect({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      // ignore: sort_child_properties_last
      child: Shimmer.fromColors(
        child: child,
        baseColor: Color(0xFF000000),
        highlightColor: Color(0xFF000000),
      ),
      gradient: LinearGradient(
        colors: [Color(0xFF999999), Color(0xFFEEEEEE), Color(0xFFFFFFFF)],
      ),
    );
  }
}
