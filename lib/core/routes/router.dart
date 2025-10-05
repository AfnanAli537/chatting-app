import 'package:chatting_app/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:chatting_app/features/sign_in/screen/login.dart';

abstract class RoutesManager {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        {
          return CupertinoPageRoute(builder: (context) => LoginScreen());
        }
      case AppRoutes.register:
        {
          // return CupertinoPageRoute(builder: (context)=> Register());
        }
    }
  }
}
