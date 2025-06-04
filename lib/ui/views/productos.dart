import 'package:e301_web/ui/cards/white_card.dart';
import 'package:e301_web/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Playeras',
      'category': 'Ropa',
      'price': '\$320',
      'stock': 25,
      'status': 'Disponible',
    },
    {
      'name': 'Sudaderas ',
      'category': 'Ropa',
      'price': '\$500',
      'stock': 50,
      'status': 'Disponible',
    },
    {
      'name': 'Gorras',
      'category': 'Accesorio',
      'price': '\$200',
      'stock': 15,
      'status': 'Stock Bajo',
    },
    {
      'name': 'Pulseras',
      'category': 'Accesorio',
      'price': '\$50',
      'stock': 0,
      'status': 'Agotado',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Gestión de Productos', style: CustomLabels.h1),
          SizedBox(height: 10),

          // Resumen rápido
          Row(
            children: [
              Expanded(
                child: WhiteCard(
                  title: 'Total Productos',
                  child: Column(
                    children: [
                      Text(
                        '90',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('productos registrados'),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: WhiteCard(
                  title: 'Stock Bajo',
                  child: Column(
                    children: [
                      Text(
                        '15',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      Text('productos con stock bajo'),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: WhiteCard(
                  title: 'Agotados',
                  child: Column(
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      Text('productos agotados'),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          // Barra de herramientas
          WhiteCard(
            title: 'Herramientas',
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  label: Text('Nuevo Producto'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.upload),
                  label: Text('Importar'),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.download),
                  label: Text('Exportar'),
                ),
                Spacer(),
                Container(
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar productos...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Lista de productos
          WhiteCard(
            title: 'Lista de Productos',
            child: Column(
              children: [
                // Encabezados
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Producto',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Categoría',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Precio',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Stock',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Estado',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Acciones',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

                // Productos
                ...products
                    .map(
                      (product) => Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey[300]!),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(flex: 3, child: Text(product['name'])),
                            Expanded(flex: 2, child: Text(product['category'])),
                            Expanded(flex: 2, child: Text(product['price'])),
                            Expanded(
                              flex: 1,
                              child: Text(product['stock'].toString()),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: _getStatusColor(product['status']),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  product['status'],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () {},
                                    tooltip: 'Editar',
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () {},
                                    tooltip: 'Eliminar',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Disponible':
        return Colors.green;
      case 'Stock Bajo':
        return Colors.orange;
      case 'Agotado':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
