import 'package:get/get.dart';

import '../features/view/home/home_page.dart';
import '../features/view/initial/initial_page.dart';
import '../features/view/players/players_page.dart';
import '../features/view/splash/splash_page.dart';

const Transition _transition = Transition.fadeIn;

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () =>  HomePage(),
    ),
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => const SplashPage(),
      transition: _transition,
    ),
    GetPage(
      name: PagesRoutes.initialRoute,
      page: () => const InitialPage(),
      transition: _transition,
    ),
    GetPage(
      name: PagesRoutes.players,
      page: () => const PlayersPage(),
      transition: _transition,
    ),
  ];
}

abstract class PagesRoutes {
  static const String baseRoute = '/';
  static const String splashRoute = '/splash';
  static const String initialRoute = '/initial';
  static const String players = '/players';
}
