import 'package:chatting_app/config/themes/app_themes.dart';
import 'package:chatting_app/core/routes/app_routes.dart';
import 'package:chatting_app/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChattingApp extends StatelessWidget {
  const ChattingApp({super.key});

  @override
 Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:Size(393, 841) ,
      splitScreenMode: true,
      minTextAdapt: true,
      builder:(context, _)=>   MaterialApp(
        debugShowCheckedModeBanner: false,

        onGenerateRoute: RoutesManager.router,
        initialRoute: AppRoutes.login,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        locale: Locale("en"),
      ),

    );
  }
}
