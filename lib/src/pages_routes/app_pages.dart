import 'package:get/get.dart';

import '../pages/base/base_screen.dart';
import '../pages/home/binding/home_binding.dart';
import '../pages/home/home_tab.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PageRoutes.baseRoute,
      page: () => BaseScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: PageRoutes.homeTabRoute,
      page: () => HomeTab(),
    ),
    // GetPage(
    //   name: PageRoutes.homeTabRoute,
    //   page: () => ProductScreen(itemModel: null,),
    // ),
  ];
}

abstract class PageRoutes {
  static String baseRoute = '/baseScreen';
  static String homeTabRoute = '/homeTabScreen';
}
