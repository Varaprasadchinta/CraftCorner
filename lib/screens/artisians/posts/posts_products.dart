import 'package:flutter/material.dart';

class PostsProducts extends StatelessWidget {
  final String productId;
  final String name;
  final String price;
  final String imageUrl;
  const PostsProducts({super.key, required this.productId, required this.name, required this.price, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 4),
      margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: (){},
            child: Container(
              margin: const EdgeInsets.all(0),
              child: Image.network(
                imageUrl,
                height: 100,
                width: 110,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            // padding: const EdgeInsets.only(bottom: 8),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                maxLines: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                '\u{20B9}$price',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                maxLines: 2,
              )
            ),
          ),
        ],
      ),
    );
  }
}