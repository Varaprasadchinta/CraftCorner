import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/screens/wishlist/wishlist_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('WishList').doc(FirebaseAuth.instance.currentUser!.uid).collection('YourWishList').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var wishListProducts = snapshot.data!.docs;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of columns as needed
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: wishListProducts.length,
            itemBuilder: (context, index) {
              var product = wishListProducts[index];
              var wishListId = product['wishListId'];
              var wishListImage = product['wishListImage'];
              var wishListName = product['wishListName'];
              var wishListPrice = product['wishListPrice'];

              return WishListProduct(wishListId: wishListId, wishListName: wishListName, wishListPrice: wishListPrice, wishListImage: wishListImage);
            },
          );
        }
        ),
    );
  }
}