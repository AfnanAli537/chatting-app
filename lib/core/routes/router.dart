
import 'package:chatting_app/core/routes/app_routes.dart';
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
    }
  }
}