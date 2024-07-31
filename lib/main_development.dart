import 'dart:io';

import 'package:doctor_app/core/di/dependency_injection.dart';
import 'package:doctor_app/core/routing/app_router.dart';
import 'package:doctor_app/doc_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

void main() async{
   HttpOverrides.global = MyHttpOverrides();
   await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp( DocApp(appRouter: AppRouter(),));
}


 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}