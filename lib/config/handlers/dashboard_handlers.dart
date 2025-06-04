import 'package:e301_web/providers/auth_provider.dart';
import 'package:e301_web/ui/views/Categorias.dart';
import 'package:e301_web/ui/views/Settings.dart';
import 'package:e301_web/ui/views/Statics.dart';
import 'package:e301_web/ui/views/Usuarios.dart';
import 'package:e301_web/ui/views/contact.dart';
import 'package:e301_web/ui/views/dashboard_view.dart';
import 'package:e301_web/ui/views/icons_view.dart';
import 'package:e301_web/ui/views/login_view.dart';
import 'package:e301_web/ui/views/nosotros.dart';
import 'package:e301_web/ui/views/productos.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return DashboardView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler icons = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return IconsView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler product = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return ProductsView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler settings = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return SettingsView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler usuarios = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return UsersView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler categoria = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return CategoriesView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler static = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return StatisticsView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler nosotros = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return NosotrosView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler contact = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return ContactView();
      } else {
        return LoginView();
      }
    },
  );

  static Handler exit = Handler(
    handlerFunc: (context, params) {
      final authProvider = Provider.of<AuthProvider>(context!);

      if (authProvider.authStatus == AuthStatus.authenticated) {
        return LoginView();
      } else {
        return LoginView();
      }
    },
  );
}
