import 'package:e301_web/config/router/router.dart';
import 'package:e301_web/providers/sidemenu_provider.dart';
import 'package:e301_web/services/navigation_service.dart';
import 'package:e301_web/ui/shared/widgets/logo.dart';
import 'package:e301_web/ui/shared/widgets/menu_item.dart';
import 'package:e301_web/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SidemenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          //Logo
          Logo(),
          SizedBox(height: 50),

          //Opciones
          TextSeparator(text: 'main'),
          MenuItem(
            text: 'Inicio',
            icon: Icons.compass_calibration_outlined,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
            isActive: false,
          ),
          MenuItem(
            text: 'Nosotros',
            icon: Icons.shopping_cart_checkout_outlined,
            onPressed: () => navigateTo(Flurorouter.nosotrosRoute),
          ),
          MenuItem(
            text: 'Estadisticas',
            icon: Icons.show_chart_outlined,
            onPressed: () => navigateTo(Flurorouter.staticsRoute),
          ),
          MenuItem(
            text: 'Categorias',
            icon: Icons.layers_clear_outlined,
            onPressed: () => navigateTo(Flurorouter.categoriaRoute),
          ),
          MenuItem(
            text: 'Productos',
            icon: Icons.dashboard_outlined,
            onPressed: () => navigateTo(Flurorouter.productsRoute),
          ),
          MenuItem(
            text: 'Usuarios',
            icon: Icons.attach_money_outlined,
            onPressed: () => navigateTo(Flurorouter.userRoute),
          ),
          MenuItem(
            text: 'config. Admin.',
            icon: Icons.people_alt_outlined,
            onPressed: () => navigateTo(Flurorouter.settingsRoute),
          ),
          SizedBox(height: 30),
          TextSeparator(text: 'UI Elements'),
          MenuItem(
            text: 'Contacto',
            icon: Icons.list_alt_outlined,
            onPressed: () => navigateTo(Flurorouter.contactRoute),
          ),
          MenuItem(
            text: 'Marketing',
            icon: Icons.mark_email_read_outlined,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Campaign',
            icon: Icons.note_alt_outlined,
            onPressed: () {},
          ),
          MenuItem(
            text: 'Black',
            icon: Icons.post_add_outlined,
            onPressed: () {},
          ),
          SizedBox(height: 30),
          TextSeparator(text: 'Exit'),
          MenuItem(
            text: 'Salir',
            icon: Icons.exit_to_app_outlined,
            onPressed: () => navigateTo(Flurorouter.loginRoute),
          ),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromARGB(255, 121, 0, 121), Color(0xff092042)],
    ),
    boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10)],
  );
}
