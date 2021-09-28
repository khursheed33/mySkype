import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoginShimmerProgress extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  const LoginShimmerProgress({
    Key? key,
    @required this.title,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Text(
        "$title",
        style: TextStyle(
          fontSize: fontSize ?? 14,
          fontWeight: fontWeight ?? FontWeight.bold,
        ),
      ),
      baseColor: Colors.white,
      highlightColor: Colors.pink,
    );
  }
}
