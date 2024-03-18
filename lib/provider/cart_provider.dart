import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/models/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier{
  addCartData({
    String? userId,
    String? cartId,
    String? cartName,
    String? cartImage,
    String? cartPrice,
    int? cartQuantity,
  }) async{
    FirebaseFirestore.instance
    .collection("cart")
    .doc(FirebaseAuth.instance.currentUser?.uid)
    .collection("yourCart")
    .doc(cartId)
    .set({
      "cartId":cartId,
      "cartName":cartName,
      "cartImage":cartImage,
      "cartPrice":cartPrice,
      "cartQuantity":cartQuantity
    });
  }

  updateReviewCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required String cartPrice,
    required int cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("cart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("yourCart")
        .doc(cartId)
        .set(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd":true,
      },
    );
  }

  List<CartDetails> cartDataList = [];
  void getCartData()async{
    List<CartDetails> newList =[];
    QuerySnapshot cartSnapShot = await  FirebaseFirestore.instance.collection("cart").doc(FirebaseAuth.instance.currentUser!.uid).collection("yourCart").get();
    cartSnapShot.docs.forEach((element) {
      CartDetails cartDetails = CartDetails(
        cartId: element.get('cartId'),
        cartImage: element.get('cartImage'),
        cartName: element.get('cartName'),
        cartPrice: element.get('cartrPrice'),
        cartQuantity: element.get('cartQuantity'),
      );
      newList.add(cartDetails);
    });
    cartDataList=newList;
    notifyListeners();
  }


  List<CartDetails> get getCartDataList{
    return cartDataList;
  }

  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("yourCart")
        .doc(cartId)
        .delete();
        notifyListeners();
  }

  // getTotalPrice(){
  //   double total =0.0;
  //   cartDataList.forEach((element) {
  //     total+=int.parse(element.cartPrice)
  //   })
  // }


}