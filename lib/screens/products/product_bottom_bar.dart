import 'package:craft_corner/widgets/counter.dart';
import 'package:flutter/material.dart';

class ProductBottomBar extends StatelessWidget {
  final String productId;
  final String name;
  final String price;
  final String imageUrl;
  final String description;
  const ProductBottomBar({
    super.key,
    required this.productId,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0,3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\u{20B9}$price',
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          // ElevatedButton.icon(
          //     onPressed: (){},
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all(
          //         Colors.redAccent,
          //       ),
          //       padding: MaterialStateProperty.all(
          //         EdgeInsets.symmetric(vertical: 13,horizontal: 15),),
          //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          //     ),
          //     icon: Icon(CupertinoIcons.cart_badge_plus),
          //     label: Text(
          //       "Add To Cart",
          //       style: TextStyle(
          //         fontSize: 16,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          // )
          CounterWidget(productId: productId,name: name,price: price,imageUrl: imageUrl,description: description,)
        ],
      ),
    );
  }
}
