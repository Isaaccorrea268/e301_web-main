import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Estadísticas de Ventas', style: CustomLabels.h1),
          SizedBox(height: 20),

          // Tarjetas de métricas principales
          _buildMainMetrics(),

          SizedBox(height: 20),

          // Gráficos y análisis detallado
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    _buildSalesChart(),
                    SizedBox(height: 20),
                    _buildTopProducts(),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    _buildCategoryBreakdown(),
                    SizedBox(height: 20),
                    _buildRecentOrders(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMainMetrics() {
    return Row(
      children: [
        Expanded(
          child: _buildMetricCard(
            'Ventas Totales',
            '\$24,580',
            '+12.5%',
            Icons.attach_money,
            Colors.green,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: _buildMetricCard(
            'Órdenes',
            '1,247',
            '+8.2%',
            Icons.shopping_cart,
            Colors.blue,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: _buildMetricCard(
            'Clientes',
            '892',
            '+15.7%',
            Icons.people,
            Colors.purple,
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: _buildMetricCard(
            'Productos',
            '156',
            '+3.1%',
            Icons.inventory,
            Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(
    String title,
    String value,
    String change,
    IconData icon,
    Color color,
  ) {
    return WhiteCard(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    change,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              value,
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesChart() {
    return WhiteCard(
      title: 'Ventas por Mes',
      child: Container(
        height: 300,
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildChartBar('Ene', 80, Colors.blue),
                  _buildChartBar('Feb', 65, Colors.blue),
                  _buildChartBar('Mar', 90, Colors.blue),
                  _buildChartBar('Abr', 75, Colors.blue),
                  _buildChartBar('May', 85, Colors.blue),
                  _buildChartBar('Jun', 95, Colors.green),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Últimos 6 meses',
              style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartBar(String month, double height, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 30,
          height: height * 2,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(height: 8),
        Text(
          month,
          style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildTopProducts() {
    return WhiteCard(
      title: 'Productos Más Vendidos',
      child: Column(
        children: [
          _buildProductItem(
            'Playera "Diseño Vintage"',
            234,
            Icons.checkroom,
            Colors.blue,
          ),
          _buildProductItem(
            'Gorra "Logo Moderno"',
            189,
            Icons.sports_baseball,
            Colors.green,
          ),
          _buildProductItem(
            'Sudadera "Arte Urbano"',
            156,
            Icons.checkroom_outlined,
            Colors.orange,
          ),
          _buildProductItem(
            'Logo Personalizado',
            98,
            Icons.brush,
            Colors.purple,
          ),
          _buildProductItem(
            'Playera "Estilo Retro"',
            87,
            Icons.checkroom,
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(String name, int sales, IconData icon, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '$sales ventas',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: sales / 250,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBreakdown() {
    return WhiteCard(
      title: 'Ventas por Categoría',
      child: Column(
        children: [
          _buildCategoryItem('Playeras', 45, Colors.blue),
          _buildCategoryItem('Gorras', 25, Colors.green),
          _buildCategoryItem('Sudaderas', 18, Colors.orange),
          _buildCategoryItem('Logos', 12, Colors.purple),
          SizedBox(height: 15),
          Container(
            height: 120,
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!, width: 2),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '1,247',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String category, int percentage, Color color) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(category, style: GoogleFonts.roboto(fontSize: 14)),
          ),
          Text(
            '$percentage%',
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentOrders() {
    return WhiteCard(
      title: 'Órdenes Recientes',
      child: Column(
        children: [
          _buildOrderItem(
            '#1234',
            'Playera Personalizada',
            '\$45.00',
            'Completado',
            Colors.green,
          ),
          _buildOrderItem(
            '#1235',
            'Gorra con Logo',
            '\$28.00',
            'En Proceso',
            Colors.orange,
          ),
          _buildOrderItem(
            '#1236',
            'Sudadera Diseño',
            '\$65.00',
            'Pendiente',
            Colors.red,
          ),
          _buildOrderItem(
            '#1237',
            'Logo Empresarial',
            '\$120.00',
            'Completado',
            Colors.green,
          ),
          _buildOrderItem(
            '#1238',
            'Pack 3 Playeras',
            '\$89.00',
            'En Proceso',
            Colors.orange,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(
    String orderNumber,
    String product,
    String amount,
    String status,
    Color statusColor,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderNumber,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.roboto(
                    fontSize: 10,
                    color: statusColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Text(product, style: GoogleFonts.roboto(fontSize: 13)),
          SizedBox(height: 2),
          Text(
            amount,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.green[600],
            ),
          ),
          if (orderNumber !=
              '#1238') // No mostrar divider en el último elemento
            Divider(height: 16, color: Colors.grey[200]),
        ],
      ),
    );
  }
}
