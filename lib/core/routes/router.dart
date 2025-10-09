import 'package:chatting_app/core/routes/app_routes.dart';
import 'package:chatting_app/features/chat/screen/chat_screen.dart';
import 'package:chatting_app/features/create_group/screen/create_group_screen.dart';
import 'package:chatting_app/features/home/screen/home_screen.dart';
import 'package:chatting_app/features/onboarding/screen/onboarding_screen.dart';
import 'package:chatting_app/features/sign_up/screen/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:chatting_app/features/sign_in/screen/login.dart';

abstract class RoutesManager {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        {
          return CupertinoPageRoute(builder: (context) => LoginScreen());
        }
      case AppRoutes.onboarding:{
         return CupertinoPageRoute(builder: (context) => OnBoardingScreen());
      }
      case AppRoutes.register:
        {
          return CupertinoPageRoute(builder: (context)=> SignUpScreen());
        }
        case AppRoutes.home:
        {
          return CupertinoPageRoute(builder: (context)=> HomeScreen());
        }
        case AppRoutes.chat:
        {
          return CupertinoPageRoute(builder: (context)=> ChatScreen());
        }
        case AppRoutes.create:
        {
          return CupertinoPageRoute(builder: (context)=> CreateGroupScreen());
        }
    }
    return null;
  }
}
