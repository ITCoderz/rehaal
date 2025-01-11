import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rehaal/bindings/screen_bindings.dart';
import 'package:rehaal/utils/app_routes.dart';
import 'package:rehaal/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(413, 898),
        minTextAdapt: true,
        builder: (_, child) {
          return GetMaterialApp(
            title: 'Rehaal',
            initialBinding: ScreenBindings(),
            initialRoute: AppRoutes.splashView,
            getPages: AppRoutes.routes,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              bottomSheetTheme: BottomSheetThemeData(
                  elevation: 0, backgroundColor: AppTheme.whiteColor),
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppTheme.primaryColor,
              ),
            ),
          );
        });
  }
}
