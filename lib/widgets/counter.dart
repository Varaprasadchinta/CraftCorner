import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/provider/wish_list_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class CounterWidget extends StatefulWidget {
  final String productId;
  final String name;
  final String price;
  final String imageUrl;
  final String description;
  const CounterWidget({
    super.key,
    required this.productId,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description
    });

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;
  bool isTrue = false;
  String? userId = FirebaseAuth.instance.currentUser?.uid;
  addCartData({
    int? cartQuantity,
  }){
    FirebaseFirestore.instance
    .collection("cart")
    .doc(userId)
    .collection("yourCart")
    .doc(widget.productId)
    .set({
      "cartId":widget.productId,
      "cartName":widget.name,
      "cartImage":widget.imageUrl,
      "cartPrice":widget.price,
      "cartQuantity":cartQuantity
    });
  }

  updateCartData({
    int? cartQuantity,
  }){
    FirebaseFirestore.instance
    .collection("cart")
    .doc(userId)
    .collection("yourCart")
    .doc(widget.productId)
    .update({
      "cartQuantity":cartQuantity
    });
  }

  cartDataDelete(){
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("yourCart")
        .doc(widget.productId)
        .delete();
  }



  @override
  Widget build(BuildContext context) {
    // UserDetails? userDetails = Provider.of<UserProvider>(context).getUser;
    // CartProvider cartProvider = Provider.of(context);
    WishListProvider wishListProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue==true? Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                if (count == 1) {
                    setState(() {
                      isTrue = false;
                    });
                    wishListProvider.cartDataDelete(
                      widget.productId
                    );
                  }
                  else if (count > 1) {
                    setState(() {
                      count--;
                    });
                    wishListProvider.updateCartData(
                      cartId: widget.productId,
                      cartName: widget.name,
                      cartImage: widget.imageUrl,
                      cartPrice: widget.price,
                      cartQuantity: count,
                      description: widget.description,
                    );
                }
              },
              child: const Icon(
                Iconsax.minus,
                // size: 15,
                color: Color(0xffd0b84c),
                ),
            ),
            const SizedBox(width: 10,),
            Text(
              "$count",
              style: const TextStyle(
                color: Color(0xffd0b84c),
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(width: 10,),
            InkWell(
              onTap: (){
                setState(() {
                  count++;
                });
                wishListProvider.updateCartData(
                  cartId: widget.productId,
                  cartName: widget.name,
                  cartImage: widget.imageUrl,
                  cartPrice: widget.price,
                  cartQuantity: count,
                  description: widget.description,
                );
              },
              child: const Icon(
                Iconsax.add,
                // size: 15,
                color: Color(0xffd0b84c)
              ),
            ),
          ],
        ),
      ):Container(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: (){
            setState(() {
              count=1;
              isTrue = true;
            });
            wishListProvider.addCartData(
              userId: userId!,
              cartId: widget.productId,
              cartName: widget.name,
              cartImage: widget.imageUrl,
              cartPrice: widget.price,
              cartQuantity: count,
              description: widget.description,
            );
          },
          child: const Text(
            "Add to cart",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      )
    );
  }
}