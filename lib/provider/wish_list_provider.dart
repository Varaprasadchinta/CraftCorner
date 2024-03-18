import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/models/wishlist_product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class WishListProvider with ChangeNotifier {
  addWishListData({
    required String wishListId,
    required String wishListName,
    var wishListPrice,
    required String wishListImage,
  }) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set({
      "wishListId": wishListId,
      "wishListName": wishListName,
      "wishListImage": wishListImage,
      "wishListPrice": wishListPrice,
      "wishList": true,
    });
  }

  removeFromWishlist({
    required String wishListId,
  }){
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
  }

///// Get WishList Data ///////
  List<ProductModel> wishList = [];

  getWishtListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach(
      (element) {
        ProductModel productModel = ProductModel(
          productId: element.get("wishListId"),
          productImage: element.get("wishListImage"),
          productName: element.get("wishListName"),
          productPrice: element.get("wishListPrice"),
          // productQuantity: element.get("wishListQuantity"),
        );
        newList.add(productModel);
      },
    );
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }





////////// Delete WishList /////
deleteWishtList(wishListId){
 FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList").doc(wishListId).delete();
}

//add to cart
addCartData({
    required String userId,
    required String cartId,
    required String cartName,
    required String cartImage,
    required String cartPrice,
    required int cartQuantity,
    required String description,
  }){
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
      "cartQuantity":cartQuantity,
      "description": description,
    });
  }

  //update cart
  updateCartData({
    required String cartId,
    required String cartName,
    required String cartImage,
    required String cartPrice,
    required int cartQuantity,
    required String description,
  }){
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
        "description": description,
      },
    );
  }

  //remove from cart
  cartDataDelete(String cartId) {
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("yourCart")
        .doc(cartId)
        .delete();
        // notifyListeners();
  }
}