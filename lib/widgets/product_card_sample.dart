import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  // final DocumentReference storeId;
  final String imageUrl;
  final String name;
  final String price;
  final String description;

  const ProductCard({
    super.key, 
    // required this.storeId,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(description),
                Text('price : $price'),
                // Text('id $storeId.value')
              ],
            ),
          ),
        ],
      ),
    );
  }
}