import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';

import 'package:magdsoft_flutter_structure/presentation/widget/cell.dart';

import '../styles/colors.dart';

Widget RowCell(
  String date,
  int map,
  String startTime,
  endTime,
  periodType,
  subject,
  grade,
) {
  DateTime dateTime = DateTime(
    int.parse(date.substring(0, 4)),
    int.parse(date.substring(5, 7)),
    int.parse(date.substring(8, 10)),
  );
  String dateFormat = DateFormat('EEEE').format(dateTime);

  return Row(
    children: [
      Cell(
        height: 12 * map,
        width: 12,
        text: "${dateFormat}\n${date}",
      ),
      Row(
        children: [
          Cell(
            width: 7,
            text: startTime.substring(0, 5),
          ),
          Cell(
            text: endTime.substring(0, 5),
            width: 7,
          ),
          Cell(
            width: 10,
            text: periodType,
          ),
          Cell(
            text: grade == firstSt ? subject : " ",
            color: AppColor.amber,
          ),
          Cell(
            text: grade == secondSt ? subject : " ",
            color: AppColor.amber,
          ),
          Cell(
            text: grade == thirdSt ? subject : " ",
            color: AppColor.amber,
          ),
        ],
      ),
    ],
  );
}
