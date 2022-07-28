import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/data/models/login_model.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router_name.dart';
import 'package:magdsoft_flutter_structure/presentation/router/arguments_data.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/login_screen.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/shared/table_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterName.rLoginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRouterName.rTableScreen:
        final LoginModel data = settings.arguments as LoginModel;
        return MaterialPageRoute(
          builder: (_) => TableScreen(
            loginModel: data,
          ),
        );
      default:
        return null;
    }
  }
}
