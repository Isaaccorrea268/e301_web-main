import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  bool autoSaveEnabled = true;
  String selectedLanguage = 'Español';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Configuración del Sistema', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(
            title: 'Preferencias Generales',
            child: Column(
              children: [
                SwitchListTile(
                  title: Text('Notificaciones'),
                  subtitle: Text('Recibir notificaciones del sistema'),
                  value: notificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      notificationsEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Modo Oscuro'),
                  subtitle: Text('Activar tema oscuro'),
                  value: darkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      darkModeEnabled = value;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Guardado Automático'),
                  subtitle: Text('Guardar cambios automáticamente'),
                  value: autoSaveEnabled,
                  onChanged: (value) {
                    setState(() {
                      autoSaveEnabled = value;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          WhiteCard(
            title: 'Configuración de Idioma',
            child: Column(
              children: [
                ListTile(
                  title: Text('Idioma'),
                  subtitle: Text(selectedLanguage),
                  trailing: DropdownButton<String>(
                    value: selectedLanguage,
                    items:
                        ['Español', 'English', 'Français'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedLanguage = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          WhiteCard(
            title: 'Acciones del Sistema',
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.backup, color: Colors.blue),
                  title: Text('Crear Respaldo'),
                  subtitle: Text('Respaldar datos del sistema'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Ejecutar'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.restore, color: Colors.green),
                  title: Text('Restaurar Sistema'),
                  subtitle: Text('Restaurar desde respaldo'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Restaurar'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.refresh, color: Colors.orange),
                  title: Text('Reiniciar Servicios'),
                  subtitle: Text('Reiniciar todos los servicios'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Reiniciar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
