import 'package:e301_web/config/handlers/admin_handlers.dart';
import 'package:e301_web/config/handlers/dashboard_handlers.dart';
import 'package:e301_web/config/handlers/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  //auth router
  static String loginRoute = 'auth/login';
  static String registerRoute = 'auth/register';

  //dashboard router
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';

  static void configureRouters() {
    router.define(
      rootRoute,
      handler: AdminHandlers.login,
      transitionType: TransitionType.none,
    );
    router.define(
      loginRoute,
      handler: AdminHandlers.login,
      transitionType: TransitionType.none,
    );
    router.define(
      registerRoute,
      handler: AdminHandlers.register,
      transitionType: TransitionType.none,
    );

    //Dashboard
    router.define(
      dashboardRoute,
      handler: DashboardHandlers.dashboard,
      transitionType: TransitionType.none,
    );
    router.define(
      iconsRoute,
      handler: DashboardHandlers.icons,
      transitionType: TransitionType.none,
    );

    //404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
