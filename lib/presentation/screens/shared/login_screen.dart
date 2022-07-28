import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/constants/constants_methode.dart';
import 'package:magdsoft_flutter_structure/data/models/login_model.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router_name.dart';
import 'package:magdsoft_flutter_structure/presentation/router/arguments_data.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_text_form.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  var typeController = TextEditingController();
  var codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ConstantMethods.systemOverLaySystem(
        statusColor: Colors.blue, statusIconColor: Colors.white);
    return BlocConsumer<GlobalCubit, GlobalState>(
      listener: (context, state) {
        if (state is SuccessfulLoginState) {
          if (state.loginModel.status == 200) {
            Navigator.pushNamed(
              context,
              AppRouterName.rTableScreen,
              arguments: LoginModel(account: state.loginModel.account),
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = GlobalCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("تسجيل الدخول"),
          ),
          body: state is LoadingLoginState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.all(20.sp),
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DefaultTextField(
                            controller: typeController,
                            label: "النوع",
                            error: "Please enter your type",
                          ),
                          SizedBox(height: 4.h),
                          DefaultTextField(
                            controller: codeController,
                            label: "الكود",
                            error: "Please enter your code",
                          ),
                          SizedBox(height: 4.h),
                          MaterialButton(
                            minWidth: 50.w,
                            height: 8.h,
                            splashColor: Colors.white,
                            color: Colors.black,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.sp),
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                cubit.postLogin(
                                  type: typeController.text,
                                  code: codeController.text,
                                );
                              }
                            },
                            child: Text(
                              "تسجيل",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
