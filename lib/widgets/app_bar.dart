import 'package:craft_corner/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'cart_menu_icon.dart';
import 'appbar.dart';

class CAppBar extends StatelessWidget {
  final String? name;
  // final String userId;
  const CAppBar({
    super.key, required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return CAppBarIcon(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(name,style: Theme.of(context).textTheme.labelMedium!.apply(color: Colors.grey)),
          Text("$name",style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.grey)),
        ],
      ),
      actions: [
        CCartCounterIcon(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
          iconColor: Colors.black,)
      ],
    );
  }
}
