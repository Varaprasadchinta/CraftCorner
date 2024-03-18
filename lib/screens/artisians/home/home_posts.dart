import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/screens/artisians/posts/posts_products.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePosts extends StatelessWidget {
  const HomePosts({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("products").doc(FirebaseAuth.instance.currentUser!.uid).collection("yourProducts").snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        var homePosts = snapshot.data!.docs;

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the number of columns as needed
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: 2,
          itemBuilder: (context,index){
            var homePost = homePosts[index];
            var name = homePost['name'];
            var price = homePost['price'];
            var productId =homePost['productId'];
            var imageUrl = homePost['imageUrl'];

            return PostsProducts(productId: productId, name: name, price: price, imageUrl: imageUrl);
          },
        );
      }
    );
  }
}