import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/screens/products/product_tile.dart';
import 'package:flutter/material.dart';
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          var products = snapshot.data!.docs;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of columns as needed
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              var product = products[index];
              var productId = product['productId'];
              var title = product['name'];
              var subtitle = product['price'];
              var imageUrl = product['imageUrl'];
              var description = product['Description'];

              return ProductTile(
                productId: productId,
                title: title,
                subtitle: subtitle,
                imageUrl: imageUrl,
                description: description,
              );
            },
          );
        },
      ),
    );
  }
}