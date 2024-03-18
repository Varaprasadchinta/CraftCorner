// import 'package:craft_corner/constants/sizes.dart';
import 'package:craft_corner/screens/products/productDisplay.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    required this.productId,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.cartQuantity,
    required this.description,
    });
  final String productId;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String description;
  final int cartQuantity;
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
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDisplay(
                    productId: productId,
                    title: title,
                    price: subtitle,
                    imageUrl: imageUrl,
                    description: description,

                    )),
                );
              },
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
              padding: const EdgeInsets.all(0),
              // padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
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
                child: Text(
                  "\u{20B9}$subtitle  X$cartQuantity'",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Iconsax.heart
                  ),
                  Icon(
                    Iconsax.box_remove
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
}
