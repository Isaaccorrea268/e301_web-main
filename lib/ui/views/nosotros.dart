import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NosotrosView extends StatelessWidget {
  const NosotrosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Acerca de Nosotros', style: CustomLabels.h1),
          SizedBox(height: 10),

          // Descripción general del equipo
          WhiteCard(
            title: 'Nuestro Equipo',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Somos un equipo de desarrollo apasionado por crear soluciones tecnológicas innovadoras. '
                  'Nuestro enfoque se centra en la calidad, la eficiencia y la satisfacción del cliente.',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Misión',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Diseñar de la mejor manera y mas creativa las ideas de nuestros clientes, '
                  'utilizando las últimas tecnologías y mejores prácticas de desarrollo.',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Visión',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Ser reconocidos como un equipo líder en desarrollo, '
                  'contribuyendo al crecimiento tecnológico de nuestros clientes.',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Título de integrantes del equipo
          Text(
            'Integrantes del Equipo',
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),

          SizedBox(height: 20),

          // Grid de integrantes del equipo
          _buildTeamGrid(),
        ],
      ),
    );
  }

  Widget _buildTeamGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determinar el número de columnas basado en el ancho disponible
        int crossAxisCount = 1;
        if (constraints.maxWidth > 1200) {
          crossAxisCount = 3;
        } else if (constraints.maxWidth > 800) {
          crossAxisCount = 2;
        }

        return GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: crossAxisCount,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildTeamMemberCard(
              name: 'Emmanuel Suarez',
              role: 'Desarrolladora Frontend',
              description:
                  'Especialista en Flutter y Photoshop. Con experiencia '
                  'creando interfaces de usuario intuitivas y responsivas.',
              skills: ['Flutter', 'Photoshop', 'UI/UX Design'],
              email: 'es6742297@gmail.com',
              imageUrl: 'assets/mane.jpg',
            ),
            _buildTeamMemberCard(
              name: 'Gildardo garcía',
              role: 'Desarrollador backend',
              description:
                  'Experto en arquitecturas de servidor y bases de datos. '
                  'Enfocado en crear APIs robustas y escalables.',
              skills: ['Python', 'mysql', 'Laravel'],
              email: 'garciareyezgildardo@gmail.com',
              imageUrl:
                  'assets/gil.jpg', // Asegúrate de tener esta imagen en tu assets
            ),
            _buildTeamMemberCard(
              name: 'Isaac Correa',
              role: 'Project Manager',
              description:
                  'Gestiona proyectos con metodologías ágiles. Coordinador del equipo '
                  'con amplia experiencia en gestión de productos tecnológicos.',
              skills: ['Scrum', 'Gestión de Equipos'],
              email: 'isaaccorrea268@gmail.com',
              imageUrl:
                  'assets/isaac.jpg', // Asegúrate de tener esta imagen en tu assets
            ),
          ],
        );
      },
    );
  }

  Widget _buildTeamMemberCard({
    required String name,
    required String role,
    required String description,
    required List<String> skills,
    required String email,
    required String imageUrl,
  }) {
    return WhiteCard(
      child: Column(
        children: [
          // Imagen del miembro del equipo
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey[600],
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 16),

          // Nombre
          Text(
            name,
            style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 4),

          // Rol
          Text(
            role,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 206, 3, 155),
            ),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 12),

          // Descripción
          Text(
            description,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 16),

          // Habilidades
          Wrap(
            spacing: 6,
            runSpacing: 6,
            alignment: WrapAlignment.center,
            children:
                skills
                    .map(
                      (skill) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: Color.fromARGB(
                            255,
                            206,
                            3,
                            155,
                          ).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            // ignore: deprecated_member_use
                            color: Color.fromARGB(
                              255,
                              206,
                              3,
                              155,
                            ).withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          skill,
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Color.fromARGB(255, 206, 3, 155),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),

          SizedBox(height: 16),

          // Email de contacto
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email_outlined, size: 16, color: Colors.grey[600]),
              SizedBox(width: 6),
              Flexible(
                child: Text(
                  email,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
