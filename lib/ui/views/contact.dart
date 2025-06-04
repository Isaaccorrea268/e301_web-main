import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Contacto', style: CustomLabels.h1),
          SizedBox(height: 10),

          // Información de la empresa
          WhiteCard(
            title: 'Información de la Empresa',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ContactItem(
                  icon: Icons.business,
                  title: 'Empresa',
                  content: 'E301 Solutions',
                ),
                SizedBox(height: 15),
                _ContactItem(
                  icon: Icons.email_outlined,
                  title: 'Email',
                  content: 'contacto@e301solutions.com',
                ),
                SizedBox(height: 15),
                _ContactItem(
                  icon: Icons.phone_outlined,
                  title: 'Teléfono',
                  content: '+52 (443) 123-4567',
                ),
                SizedBox(height: 15),
                _ContactItem(
                  icon: Icons.phone_android_outlined,
                  title: 'WhatsApp',
                  content: '+52 (443) 987-6543',
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Redes sociales
          WhiteCard(
            title: 'Síguenos en Redes Sociales',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _SocialMediaButton(
                      icon: Icons.facebook,
                      label: 'Facebook',
                      color: Color(0xFF1877F2),
                      onPressed: () => print('Facebook clicked'),
                    ),
                    _SocialMediaButton(
                      icon: Icons.camera_alt,
                      label: 'Instagram',
                      color: Color(0xFFE4405F),
                      onPressed: () => print('Instagram clicked'),
                    ),
                    _SocialMediaButton(
                      icon: Icons.alternate_email,
                      label: 'Twitter',
                      color: Color(0xFF1DA1F2),
                      onPressed: () => print('Twitter clicked'),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _SocialMediaButton(
                      icon: Icons.work_outline,
                      label: 'LinkedIn',
                      color: Color(0xFF0A66C2),
                      onPressed: () => print('LinkedIn clicked'),
                    ),
                    _SocialMediaButton(
                      icon: Icons.video_library,
                      label: 'YouTube',
                      color: Color(0xFFFF0000),
                      onPressed: () => print('YouTube clicked'),
                    ),
                    _SocialMediaButton(
                      icon: Icons.code,
                      label: 'GitHub',
                      color: Color(0xFF333333),
                      onPressed: () => print('GitHub clicked'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Ubicación
          WhiteCard(
            title: 'Nuestra Ubicación',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ContactItem(
                  icon: Icons.location_on_outlined,
                  title: 'Dirección',
                  content:
                      'Av. Tecnológico #1500\nCol. Lomas de Santiaguito\nMorelia, Michoacán, México\nC.P. 58120',
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map_outlined,
                          size: 50,
                          color: Colors.grey[600],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Mapa de Ubicación',
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Morelia, Michoacán',
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Horarios de atención
          WhiteCard(
            title: 'Horarios de Atención',
            child: Column(
              children: [
                _ScheduleItem(
                  day: 'Lunes - Viernes',
                  hours: '9:00 AM - 6:00 PM',
                ),
                _ScheduleItem(day: 'Sábados', hours: '10:00 AM - 2:00 PM'),
                _ScheduleItem(
                  day: 'Domingos',
                  hours: 'Cerrado',
                  isSpecial: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.withAlpha(50),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue[700], size: 20),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 4),
              Text(
                content,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialMediaButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _SocialMediaButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  State<_SocialMediaButton> createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<_SocialMediaButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color:
                isHover
                    ? widget.color.withAlpha(100)
                    : widget.color.withAlpha(50),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isHover ? widget.color : widget.color.withAlpha(100),
              width: 1,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: widget.color, size: 24),
              SizedBox(height: 4),
              Text(
                widget.label,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: widget.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScheduleItem extends StatelessWidget {
  final String day;
  final String hours;
  final bool isSpecial;

  const _ScheduleItem({
    required this.day,
    required this.hours,
    this.isSpecial = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            day,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          Text(
            hours,
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: isSpecial ? Colors.red[600] : Colors.grey[600],
              fontWeight: isSpecial ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
