
import 'package:assessment/utils/routes/routes_name.dart';
import 'package:assessment/view/courses_view.dart';
import 'package:assessment/view/login_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';



class Routes {

  static var list = [
    GetPage(
      name: RoutesName.login,
      page: () => LoginPage(),
    ),
    GetPage(
      name: RoutesName.courses,
      page: () => const CoursesPage(),
    ),
  ];
}