import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class Cell extends StatelessWidget {
  const Cell({
    Key? key,
    this.text,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);
  final String? text;
  final Color? color;
  final int? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.6.h),
      height: height?.h ?? 12.h,
      width: width?.h ?? 12.h,
      alignment: Alignment.center,
      child: Text(
        text == null ? "" : "$text",
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
        color: color ?? AppColor.blue,
        borderRadius: BorderRadius.circular(2.h),
      ),
    );
  }
}
