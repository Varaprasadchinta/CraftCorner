import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:craft_corner/provider/cart_provider.dart';
import 'package:craft_corner/screens/cart/cart_products.dart';
import 'package:craft_corner/screens/deliverydetails/delivery_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int totalPrice=0;
  int productCount=0;
  int price=0;
  List<QueryDocumentSnapshot> products = [];
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }
  void _fetchProducts() async {
    final snapshot = await FirebaseFirestore.instance.collection('cart').doc(FirebaseAuth.instance.currentUser!.uid).collection('yourCart').get();
    products = snapshot.docs;
    price = 0;
    productCount=0;
    for (var product in products) {
      price += product['cartPrice'] as int;
      productCount += product['cartQuantity'] as int;
      print(product['cartQuantity']);
    }
    totalPrice=price*productCount;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('cart').doc(FirebaseAuth.instance.currentUser!.uid).collection('yourCart').snapshots(),
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
              var cartId = product['cartId'];
              var cartName = product['cartName'];
              var cartPrice = product['cartPrice'];
              var imageUrl = product['cartImage'];
              var cartQuantity = product['cartQuantity'];
              var subtitle=cartPrice;
              var description = product['description'];
              return CartProductTile(
                productId: cartId,
                title: cartName,
                subtitle: subtitle,
                imageUrl: imageUrl,
                quantity: cartQuantity,
                description:description,
              );
            },
          );
        },
      ),
      bottomNavigationBar: ListTile(
        title: const Text(
          "\u{20B9}1000",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
         ),
        trailing: Container(
          
          decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryDetails()
                  )
              );
            },
            child: const Text(
              "Proceed to Buy",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15
              ),
            ),
          ),
              ),
        ),
        ),
    );
  }
}
