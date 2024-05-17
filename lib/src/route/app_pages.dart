import 'package:get/get.dart';

import '../features/controllers/home/home_binding.dart';
import '../features/view/home/home_page.dart';
import '../features/view/initial/initial_page.dart';
import '../features/view/matches/matches_page.dart';
import '../features/view/placing/placing_page.dart';
import '../features/view/players/players_page.dart';
import '../features/view/splash/splash_page.dart';
import '../features/view/statistics/statistics_page.dart';

const Transition _transition = Transition.rightToLeft;

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => HomePage(),
      transition: Transition.fadeIn,
      binding: HomeBinding(),
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
    GetPage(
      name: PagesRoutes.placing,
      page: () => const PlacingPage(),
      transition: _transition,
    ),
    GetPage(
      name: PagesRoutes.matches,
      page: () => const MatchesPage(),
      transition: _transition,
    ),
    GetPage(
      name: PagesRoutes.statistics,
      page: () => const StatisticsPage(),
      transition: _transition,
    ),
  ];
}

abstract class PagesRoutes {
  static const String baseRoute = '/';
  static const String splashRoute = '/splash';
  static const String initialRoute = '/initial';
  static const String players = '/players';
  static const String placing = '/placing';
  static const String matches = '/matches';
  static const String statistics = '/statistics';
}
