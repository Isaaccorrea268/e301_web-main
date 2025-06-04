import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      CategoryItem(
        title: 'Sudaderas',
        icon: Icons.checkroom,
        description: 'Diseños únicos y personalizados',
        color: Colors.blue,
        products: 25,
      ),
      CategoryItem(
        title: 'Playeras',
        icon: Icons.sports_baseball,
        description: 'Estampados creativos y originales',
        color: Colors.green,
        products: 45,
      ),
      CategoryItem(
        title: 'Gorras',
        icon: Icons.sports_baseball_rounded,
        description: 'Bordados y estampados premium',
        color: Colors.orange,
        products: 18,
      ),
      CategoryItem(
        title: 'Tazas',
        icon: Icons.coffee,
        description: 'Sublimación de alta calidad',
        color: Colors.brown,
        products: 32,
      ),
      CategoryItem(
        title: 'Llaveros',
        icon: Icons.key,
        description: 'Acrílico y metal personalizado',
        color: Colors.purple,
        products: 15,
      ),
      CategoryItem(
        title: 'Stickers',
        icon: Icons.star,
        description: 'Vinil resistente al agua',
        color: Colors.pink,
        products: 28,
      ),
    ];

    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Text('Categorías de Productos', style: CustomLabels.h1),
          SizedBox(height: 10),
          Text(
            'Explora nuestra amplia gama de productos personalizables',
            style: CustomLabels.h1.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 30),

          // Grid de categorías
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithResponsiveColumns(
              crossAxisCount: _getCrossAxisCount(context),
              childAspectRatio: 1.2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return _CategoryCard(category: category);
            },
          ),

          SizedBox(height: 40),

          // Sección de estadísticas
          WhiteCard(
            title: 'Estadísticas de Productos',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _StatCard(
                      title: 'Total Productos',
                      value: '163',
                      icon: Icons.inventory,
                      color: Colors.blue,
                    ),
                    _StatCard(
                      title: 'Categorías',
                      value: '6',
                      icon: Icons.category,
                      color: Colors.green,
                    ),
                    _StatCard(
                      title: 'Diseños Activos',
                      value: '89',
                      icon: Icons.design_services,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 4;
    if (width > 800) return 3;
    if (width > 600) return 2;
    return 1;
  }
}

class _CategoryCard extends StatefulWidget {
  final CategoryItem category;

  const _CategoryCard({required this.category});

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
        _animationController.forward();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: widget.category.color.withOpacity(0.1),
                    blurRadius: isHovered ? 20 : 10,
                    offset: Offset(0, isHovered ? 8 : 4),
                  ),
                ],
              ),
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        widget.category.color.withOpacity(0.1),
                        widget.category.color.withOpacity(0.05),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: widget.category.color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          widget.category.icon,
                          size: 32,
                          color: widget.category.color,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        widget.category.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.category.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: widget.category.color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${widget.category.products} productos',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final IconData icon;
  final String description;
  final Color color;
  final int products;

  CategoryItem({
    required this.title,
    required this.icon,
    required this.description,
    required this.color,
    required this.products,
  });
}

// Clase auxiliar para grid responsivo
class SliverGridDelegateWithResponsiveColumns extends SliverGridDelegate {
  final int crossAxisCount;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  const SliverGridDelegateWithResponsiveColumns({
    required this.crossAxisCount,
    this.childAspectRatio = 1.0,
    this.crossAxisSpacing = 0.0,
    this.mainAxisSpacing = 0.0,
  });

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride:
          (constraints.crossAxisExtent + crossAxisSpacing) /
              crossAxisCount *
              childAspectRatio +
          mainAxisSpacing,
      crossAxisStride:
          (constraints.crossAxisExtent + crossAxisSpacing) / crossAxisCount,
      childMainAxisExtent:
          (constraints.crossAxisExtent + crossAxisSpacing) /
          crossAxisCount *
          childAspectRatio,
      childCrossAxisExtent:
          (constraints.crossAxisExtent -
              crossAxisSpacing * (crossAxisCount - 1)) /
          crossAxisCount,
      reverseCrossAxis: false,
    );
  }

  @override
  bool shouldRelayout(covariant SliverGridDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
