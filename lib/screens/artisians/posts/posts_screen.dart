import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/screens/artisians/posts/posts_products.dart';
import 'package:craft_corner/widgets/artisian_navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Posts"),
        leading: BackButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ArtisianNavigationBarApp())
            );
          },
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("products").doc(FirebaseAuth.instance.currentUser!.uid).collection("yourProducts").snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          var posts = snapshot.data!.docs;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of columns as needed
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
             itemCount: posts.length,
             itemBuilder: (context,index){
              var post = posts[index];
              var name = post['name'];
              var price = post['price'];
              var productId =post['productId'];
              var imageUrl = post['imageUrl'];

              return PostsProducts(productId: productId, name: name, price: price, imageUrl: imageUrl);
            },
          );

        },
      ),
    );
  }
}