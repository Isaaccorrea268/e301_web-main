import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          // Header Section
          _buildHeader(),
          SizedBox(height: 30),

          // Main Content Grid
          _buildMainContent(),
          SizedBox(height: 30),

          // Services Section
          _buildServicesSection(),
          SizedBox(height: 30),

          // Team Section
          _buildTeamSection(),
          SizedBox(height: 30),

          // Values Section
          _buildValuesSection(),
          SizedBox(height: 30),

          // Contact CTA
          _buildContactSection(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sobre Nosotros',
            style: CustomLabels.h1.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Color(0xff092044),
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 4,
            width: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Story Card
        Expanded(
          flex: 2,
          child: WhiteCard(
            title: 'Nuestra Historia',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Creatividad sin límites',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff092044),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Somos una tienda especializada en diseño gráfico con más de 8 años de experiencia transformando ideas en realidades visuales impactantes. Nuestro equipo de diseñadores creativos y apasionados trabaja día a día para ofrecer soluciones únicas que conecten con tu audiencia.',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    height: 1.6,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Desde logotipos memorables hasta campañas publicitarias completas, cada proyecto es una oportunidad para crear algo extraordinario. Creemos que el buen diseño no solo se ve bien, sino que comunica, inspira y genera resultados.',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    height: 1.6,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.1),
                        Colors.purple.withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          '"El diseño es donde la ciencia y el arte se equilibran." - Robin Mathew',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Color(0xff092044),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 20),

        // Statistics Card
        Expanded(
          flex: 1,
          child: Column(
            children: [
              WhiteCard(
                title: 'Nuestros Números',
                child: Column(
                  children: [
                    _buildStatItem(
                      '500+',
                      'Proyectos Completados',
                      Icons.design_services,
                    ),
                    _buildStatItem(
                      '150+',
                      'Clientes Satisfechos',
                      Icons.people,
                    ),
                    _buildStatItem('8+', 'Años de Experiencia', Icons.timeline),
                    _buildStatItem(
                      '24/7',
                      'Soporte al Cliente',
                      Icons.support_agent,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(String number, String label, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  number,
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff092044),
                  ),
                ),
                Text(
                  label,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificationItem(String certification) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(Icons.verified, color: Colors.green, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              certification,
              style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    return WhiteCard(
      title: 'Nuestros Servicios',
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        children: [
          _buildServiceCard(
            'Diseño de Logotipos',
            Icons.brush,
            'Identidades visuales únicas y memorables',
          ),
          _buildServiceCard(
            'Branding Completo',
            Icons.palette,
            'Estrategias de marca integrales',
          ),
          _buildServiceCard(
            'Diseño Web',
            Icons.web,
            'Sitios web modernos y responsivos',
          ),
          _buildServiceCard(
            'Material Publicitario',
            Icons.campaign,
            'Folletos, banners y más',
          ),
          _buildServiceCard(
            'Packaging',
            Icons.inventory_2,
            'Diseño de empaques atractivos',
          ),
          _buildServiceCard(
            'Ilustración',
            Icons.draw,
            'Ilustraciones personalizadas',
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon, String description) {
    return Container(
      width: 280,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.grey[50]!],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.1),
                  Colors.purple.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.blue, size: 28),
          ),
          SizedBox(height: 15),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff092044),
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection() {
    return WhiteCard(
      title: 'Nuestro Equipo',
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Creativos apasionados',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff092044),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Nuestro equipo está formado por diseñadores gráficos senior, especialistas en UX/UI, ilustradores y estrategas de marca. Cada miembro aporta una perspectiva única y años de experiencia en la industria creativa.',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    height: 1.6,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 15,
                  runSpacing: 10,
                  children: [
                    _buildSkillChip('Adobe Creative Suite'),
                    _buildSkillChip('Figma & Sketch'),
                    _buildSkillChip('Fotografía'),
                    _buildSkillChip('Marketing Digital'),
                    _buildSkillChip('Motion Graphics'),
                    _buildSkillChip('Print Design'),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 30),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Image(image: AssetImage('equipo.jpg'), width: 300),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.1),
            Colors.purple.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: Text(
        skill,
        style: GoogleFonts.roboto(
          fontSize: 12,
          color: Color(0xff092044),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildValuesSection() {
    return WhiteCard(
      title: 'Nuestros Valores',
      child: Row(
        children: [
          Expanded(
            child: _buildValueItem(
              'Creatividad',
              Icons.lightbulb_circle,
              'Pensamos fuera de la caja',
            ),
          ),
          Expanded(
            child: _buildValueItem(
              'Calidad',
              Icons.diamond,
              'Excelencia en cada detalle',
            ),
          ),
          Expanded(
            child: _buildValueItem(
              'Colaboración',
              Icons.handshake,
              'Trabajamos juntos hacia el éxito',
            ),
          ),
          Expanded(
            child: _buildValueItem(
              'Innovación',
              Icons.rocket_launch,
              'Siempre a la vanguardia',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueItem(String title, IconData icon, String description) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.purple]),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          SizedBox(height: 15),
          Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff092044),
            ),
          ),
          SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              fontSize: 12,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection() {
    return WhiteCard(
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff092044), Color(0xff092042)],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¿Listo para crear algo increíble?',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Contactanos hoy y descubre cómo podemos ayudarte a llevar tu marca al siguiente nivel.',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 30),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la navegación al formulario de contacto
                print('Navegar a contacto');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color(0xff092044),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Contáctanos',
                    style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
