import 'package:e301_web/providers/sidemenu_provider.dart';
import 'package:e301_web/ui/shared/widgets/navbar_avatar.dart';
import 'package:e301_web/ui/shared/widgets/notification_indicator.dart';
import 'package:e301_web/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          //icono del menu
          if(size.width<=700)
            IconButton(
              onPressed: ()=> SidemenuProvider.openMenu(), 
              icon: Icon(Icons.menu_outlined)
            ),

          SizedBox(width: 5),

          //caja de busqueda
          if(size.width>390)
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 250),
              child: SearchText(),
            ),

          //Notificaciones
          Spacer(),
          NotificationIndicator(),

          //Avatar
          SizedBox(width: 10),
          NavbarAvatar(),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
  );
}
