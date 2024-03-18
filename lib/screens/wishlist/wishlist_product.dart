import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class WishListProduct extends StatefulWidget {
  final String wishListId;
  final String wishListName;
  final String wishListPrice;
  final String wishListImage;
  const WishListProduct({
    super.key, 
    required this.wishListId,
    required this.wishListName,
    required this.wishListPrice,
    required this.wishListImage,
  });

  @override
  State<WishListProduct> createState() => _WishListProductState();
}

class _WishListProductState extends State<WishListProduct> {

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
                  widget.wishListImage,
                  height: 100,
                  width: 110,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              // padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.wishListName,
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
              padding: const EdgeInsets.only(bottom: 0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: 
                Text(
                  '\u{20B9}${widget.wishListPrice}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                )
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      FirebaseFirestore.instance.collection('WishList').doc(FirebaseAuth.instance.currentUser!.uid).collection('YourWishList').doc(widget.wishListId).delete();
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      fill: 1.0,
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      );
  }
}
