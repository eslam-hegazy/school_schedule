import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/data/models/login_model.dart';
import 'package:magdsoft_flutter_structure/data/models/table_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  static GlobalCubit get(context) => BlocProvider.of(context);

  /////////////////////login Data
  LoginModel? loginModel;
  void postLogin({required String type, required String code}) async {
    emit(LoadingLoginState());
    await DioHelper.postData(
      url: loginUrl,
      body: {
        "deviceId": "asdasdasd-qweqweasdasdasd",
        "type": type,
        "code": code,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel!.message);
      CacheHelper.saveDataSharedPreference(
          key: "token", value: loginModel!.account!.apiToken);
      emit(SuccessfulLoginState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorLoginState(loginModel!));
    });
  }

  ////////////////////table data
  TableModel? tableModel;
  List dateTable = [];
  var map = Map();
  void getData({required String apiToken}) async {
    emit(LoadingTableState());
    await DioHelper.postData(url: tableUrl, body: {
      "apiToken": apiToken,
    }).then((value) {
      tableModel = TableModel.fromJson(value.data);
      emit(SuccessfulTableState());
      tableModel!.exams.forEach((e) {
        dateTable.add(e.date);
      });
      dateTable.forEach((element) {
        if (!map.containsKey(element)) {
          map[element] = 1;
        } else {
          map[element] += 1;
        }
      });
      print("this ${map}");
    }).catchError(
      (error) {
        print(error.toString());
        emit(ErrorTableState());
      },
    );
  }
}
