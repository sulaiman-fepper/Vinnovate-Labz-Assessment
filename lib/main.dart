import 'package:assessment/utils/routes/routes.dart';
import 'package:assessment/utils/routes/routes_name.dart';
import 'package:assessment/view/login_view.dart';
import 'package:assessment/view_model/courses_view_model.dart';
import 'package:assessment/view_model/login_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => CoursesViewModel()),
      ],
      child: ScreenUtilInit(
        child: GetMaterialApp(
          builder: EasyLoading.init(),
          initialRoute: RoutesName.login,
          getPages: Routes.list,
        ),
      )
  ));
}

