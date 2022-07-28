import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';

import 'package:magdsoft_flutter_structure/data/models/login_model.dart';
import 'package:magdsoft_flutter_structure/presentation/router/arguments_data.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/cell.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/row_cell.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/row_cell2.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants_methode.dart';

class TableScreen extends StatelessWidget {
  final LoginModel loginModel;
  TableScreen({
    Key? key,
    required this.loginModel,
  }) : super(key: key);
  var token = CacheHelper.getDataFromSharedPreference(key: "token");
  List da = ["2022-06-30", "2022-06-30", "2022-06-30"];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GlobalCubit()..getData(apiToken: token),
      child: BlocConsumer<GlobalCubit, GlobalState>(
        builder: (context, state) {
          var cubit = GlobalCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // cubit.getData(apiToken: token);
                print(cubit.map['1']);

                // print(
                //     "2022-06-30".allMatches(cubit.dateTable.toString()).length);
              },
              child: const Icon(Icons.add),
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 10.h,
                    width: double.infinity,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                              CacheHelper.removeData(key: "token");
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          "جدول الاختبارات",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.sp),
                        bottomRight: Radius.circular(15.sp),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.h),
                    child: Text(
                      loginModel.account!.name.toString(),
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          right: 1.5.h, left: 1.5.h, bottom: 1.5.h),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Cell(
                                            color: Colors.white,
                                            height: 5,
                                            width: 12,
                                          ),
                                          Cell(
                                            color: Colors.white,
                                            height: 5,
                                            width: 16,
                                          ),
                                          Cell(
                                            color: Colors.white,
                                            height: 5,
                                            width: 10,
                                          ),
                                          Cell(
                                            color: AppColor.amber,
                                            text: "الصف الاول",
                                          ),
                                          Cell(
                                            color: AppColor.amber,
                                            text: "الصف الثاني",
                                          ),
                                          Cell(
                                            color: AppColor.amber,
                                            text: "الصف الثالث",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Cell(
                                            text: "اليوم",
                                          ),
                                          Cell(
                                            height: 11,
                                            width: 16,
                                            text: "التوقيت",
                                          ),
                                          Cell(
                                            height: 11,
                                            width: 10,
                                            text: "نوع الاختبار",
                                          ),
                                          Cell(
                                            width: 50,
                                            text: "المادة",
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: const [
                                          Cell(
                                            height: 5,
                                            width: 12,
                                            color: Colors.white,
                                          ),
                                          Cell(
                                            text: "من",
                                            width: 7,
                                            height: 5,
                                          ),
                                          Cell(
                                            width: 7,
                                            height: 5,
                                            text: "الى",
                                          ),
                                        ],
                                      ),
                                      ...cubit.tableModel!.exams.map((e) {
                                        return RowCell(
                                          e.date,
                                          cubit.map[e.date],
                                          e.startTime,
                                          e.endTime,
                                          e.periodType,
                                          e.subject.name,
                                          e.grade.name,
                                        );
                                      }).toList(),
                                      // RowCell2("323", "23", "322423",
                                      //     "23423423", "sgs", "sdfs"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
