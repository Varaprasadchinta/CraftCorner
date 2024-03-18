import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:craft_corner/provider/cart_provider.dart';
// import 'package:craft_corner/screens/cart/cart_products.dart';
import 'package:craft_corner/screens/order/order_product_tile.dart';
// import 'package:craft_corner/screens/deliverydetails/delivery_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('orders').doc(FirebaseAuth.instance.currentUser!.uid).collection('yourOrders').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          var cartProducts = snapshot.data!.docs;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: cartProducts.length,
            itemBuilder: (context, index) {
              var product = cartProducts[index];
              var cartId = product['orderId'];
              var cartName = product['orderName'];
              var cartPrice = product['orderPrice'];
              var imageUrl = product['image'];
              var cartQuantity = product['orderQuantity'];
              // var subtitle=cartPrice;
              var description = product['description'];
              return OrderProductTile(
                productId: cartId,
                title: cartName,
                subtitle: cartPrice,
                imageUrl: imageUrl,
                quantity: cartQuantity,
                description:description,
              );
            },
          );
        },
      ),
    );
  }
}
