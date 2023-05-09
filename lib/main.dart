import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bagas Sepatu',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: ProductListScreen(),
    );
  }
}

class Product {
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  Product(this.name, this.imageUrl, this.description, this.price);
}

final List<Product> products = [
  Product('No.1', 'assets/produk/adidas.png', 'Adidas', 5400000.0),
  Product('No.2', 'assets/produk/newbalance.png', 'New Balance', 6500000.0),
  Product('No.3', 'assets/produk/vans.png', 'Vans', 3950000.0),
  Product('No.4', 'assets/produk/convers.png', 'Convers', 8400000.0),
  Product('No.5', 'assets/produk/puma.png', 'Puma', 4300000.0),
  Product('No.6', 'assets/produk/nike.png', 'Nike', 5200000.0),
];

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key});

  final List<Color> colors = [
    Color.fromARGB(255, 221, 137, 224)!,
    Color.fromARGB(255, 136, 194, 218)!,
    Color.fromARGB(255, 133, 209, 133)!,
    Color.fromARGB(255, 248, 99, 99)!,
    Color.fromARGB(255, 226, 153, 153)!,
    Color.fromARGB(255, 219, 224, 136)!,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: const [
                Text('TOKO SEPATU BAGAS RIYADI',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                SizedBox(width: 16.0),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/crown-10716.png'),
                  radius: 24.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colors[index % colors.length],
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name,
                                style: const TextStyle(fontSize: 20.0)),
                            const SizedBox(height: 8.0),
                            Text(product.description),
                            const SizedBox(height: 8.0),
                            Text('${product.price}',
                                style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.network(product.imageUrl,
                          width: 80.0, height: 80.0),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
