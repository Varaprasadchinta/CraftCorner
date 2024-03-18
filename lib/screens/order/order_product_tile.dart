import 'package:craft_corner/provider/wish_list_provider.dart';
import 'package:craft_corner/screens/products/productDisplay.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class OrderProductTile extends StatelessWidget {
  final String productId;
  final String title;
  final String subtitle;
  final String imageUrl;
  final int? quantity;
  final String description;

  const OrderProductTile({
    super.key,
    required this.productId,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.description,
    this.quantity=-1,
  });

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
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
                Navigator.push(context,MaterialPageRoute(builder: (context) => ProductDisplay(productId: productId, title: title, price: subtitle, imageUrl: imageUrl, description: description)));
              },
              child: Container(
                margin: const EdgeInsets.all(0),
                child: Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/epics-476d9.appspot.com/o/image6.jpg?alt=media&token=600d2e3d-c2f1-426a-8849-5b03e5f52dc8",
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
                child: quantity!=-1? Text(
                  '\u{20B9}$subtitle x$quantity',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                ):
                Text(
                  '\u{20B9}$subtitle',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                )
              ),
            ),
             Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Iconsax.heart
                  ),
                  InkWell(
                    onTap: wishListProvider.cartDataDelete(productId),
                    child: const Icon(
                      Iconsax.card_remove5
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
  }
}