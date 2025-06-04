import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Gestión de Usuarios', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(
            title: 'Usuarios Activos',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total de usuarios registrados: 1,245'),
                SizedBox(height: 10),
                Text('Usuarios activos hoy: 89'),
                SizedBox(height: 10),
                Text('Nuevos registros esta semana: 23'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Ver todos los usuarios'),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          WhiteCard(
            title: 'Roles y Permisos',
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.admin_panel_settings),
                  title: Text('Administradores'),
                  subtitle: Text('3 usuarios'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.supervisor_account),
                  title: Text('Moderadores'),
                  subtitle: Text('2 usuarios'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Usuarios estándar'),
                  subtitle: Text('1,245 usuarios'),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
