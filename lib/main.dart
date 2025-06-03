import 'package:e301_web/config/router/router.dart';
import 'package:e301_web/providers/auth_provider.dart';
import 'package:e301_web/services/local_storage.dart';
import 'package:e301_web/services/navigation_service.dart';
import 'package:e301_web/ui/layouts/auth/auth_layout.dart';
import 'package:e301_web/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:e301_web/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRouters();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: (_) => AuthProvider()),
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return SplashLayout();
        }

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else{
          return AuthLayout(child: child!);
        }
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: WidgetStatePropertyAll(Colors.amber.withAlpha(100)),
        ),
      ),
    );
  }
}
