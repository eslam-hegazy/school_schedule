import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';

import 'package:magdsoft_flutter_structure/presentation/widget/cell.dart';

import '../styles/colors.dart';

Widget RowCell2(
  String date,
  String startTime,
  endTime,
  periodType,
  subject,
  grade,
) {
  // DateTime dateTime = DateTime(
  //   int.parse(date.substring(0, 4)),
  //   int.parse(date.substring(5, 7)),
  //   int.parse(date.substring(8, 10)),
  // );
  // String dateFormat = DateFormat('EEEE').format(dateTime);
  // print(dateFormat);
  return Row(
    children: [
      Cell(
        width: 12,
        text: "day\n121231",
      ),
      Row(
        children: [
          Cell(
            width: 7,
            text: "23",
          ),
          Cell(
            text: "232",
            width: 7,
          ),
          Cell(
            width: 10,
            text: "2323",
          ),
          Cell(
            text: "sdf ",
            color: AppColor.amber,
          ),
          Cell(
            text: " sdfs",
            color: AppColor.amber,
          ),
          Cell(
            text: "sdfs ",
            color: AppColor.amber,
          ),
        ],
      ),
    ],
  );
}
