import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_muse/app/routes.dart';
import 'package:note_muse/view/common/app_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.primary.withOpacity(.9),
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dasesa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: AppColors.background,
          error: AppColors.danger,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
