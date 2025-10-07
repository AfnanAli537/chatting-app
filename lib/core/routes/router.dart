import 'package:chatting_app/core/routes/app_routes.dart';
import 'package:chatting_app/features/main_layout/screen/main_screen.dart';
import 'package:chatting_app/features/notification/screen/notification_screen.dart';
import 'package:chatting_app/features/profile/screen/profile_screen.dart';

import 'package:flutter/cupertino.dart';
abstract class RoutesManager{
  static Route? router(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.login:{
        // return CupertinoPageRoute(builder: (context)=> Login());
      }
      case AppRoutes.register:{
        // return CupertinoPageRoute(builder: (context)=> Register());
      }
      case AppRoutes.profile:{
        return CupertinoPageRoute(builder: (context)=> ProfileScreen());
      }
      case AppRoutes.notification:{
        return CupertinoPageRoute(builder: (context)=> NotificationsScreen());
      }
      case AppRoutes.main: // <--- instead of going directly to profile
      {
        return CupertinoPageRoute(builder: (context) => const MainScreen());
      }
    }
    return null;
  }
}