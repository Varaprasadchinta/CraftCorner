import 'package:craft_corner/provider/wish_list_provider.dart';
import 'package:craft_corner/screens/products/productDisplay.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatefulWidget {
  final IconData? cartIcon;
  final String productId;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String description;
  final int? quantity;
  final bool? isWishList;

  const ProductTile({
    super.key, 
    required this.productId,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    this.description="",
    this.quantity=-1,
    this.cartIcon=Iconsax.shopping_bag,
    this.isWishList=false,
  });

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool wishListBool = false;

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDisplay(
                    productId: widget.productId,
                    title: widget.title,
                    price: widget.subtitle,
                    imageUrl: widget.imageUrl,
                    description: widget.description,
                    )),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(0),
                child: Image.network(
                  widget.imageUrl,
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
                  widget.title,
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
                child: widget.quantity!=-1? Text(
                  '\u{20B9}${widget.subtitle} x${widget.quantity}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                ):
                const Text(
                  "store name",
                  style: TextStyle(
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
                  InkWell(
                    onTap: (){
                      setState(() {
                        wishListBool=!wishListBool;
                      });
                      if(wishListBool==true){
                        wishListProvider.addWishListData(wishListId: widget.productId, wishListName: widget.title, wishListImage: widget.imageUrl,wishListPrice: widget.subtitle);
                      }else{
                        wishListProvider.removeFromWishlist(wishListId: widget.productId);
                      }
                    },
                    child: wishListBool==false? const Icon(
                      Icons.favorite_border_outlined,
                      // color: Colors,
                      // semanticLabel: "Text to acc",
                    ):
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      fill: 1.0,
                    )
                  ),
                  Text(
                  '\u{20B9}${widget.subtitle}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                )
                ],
              ),
            )
          ],
        ),
      );
  }
}
