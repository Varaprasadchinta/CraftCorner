// import 'package:craft_corner/src/features/screens/products/product_bottom_bar.dart';
import 'package:craft_corner/screens/products/product_bottom_bar.dart';
import 'package:craft_corner/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

// import '../../../utils/widgets/appbar/appbar.dart';

class ProductDisplay extends StatelessWidget {
  final String productId;
  final String title;
  final String price;
  final String imageUrl;
  final String description;
  const ProductDisplay({
    super.key,
    required this.productId,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Scaffold(
        body: ListView(
          children: [
            CAppBarIcon(
              showBackArrow: true,
              title: Column(
                children: [
                  Text('product',style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.grey))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  imageUrl,
                  height: 300,
                  // width: Sizes.getScreenWidth(context),
                ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[850],
                            ),
                          ),
                          const Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                              size: 30,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemSize: 25,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                            itemBuilder: (context,_) => const Icon(
                              Iconsax.star,
                              color: Colors.orange,
                            ),
                            onRatingUpdate: (index){},
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //       padding: EdgeInsets.all(5),
                          //       decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         borderRadius: BorderRadius.circular(20),
                          //         boxShadow: [
                          //           BoxShadow(
                          //             color: Colors.grey.withOpacity(0.5),
                          //             spreadRadius: 3,
                          //             blurRadius: 10,
                          //             offset: Offset(0,3),
                          //           )
                          //         ]
                          //       ),
                          //       child: Icon(
                          //         Iconsax.minus,
                          //         size: 18,
                          //       ),
                          //     ),
                          //     Container(
                          //       margin: EdgeInsets.symmetric(horizontal: 10),
                          //       child: Text(
                          //         "02",
                          //         style: TextStyle(
                          //           fontSize: 18,
                          //           fontWeight: FontWeight.bold,
                          //           color: Colors.grey[850],
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       padding: EdgeInsets.all(5),
                          //       decoration: BoxDecoration(
                          //           color: Colors.white,
                          //           borderRadius: BorderRadius.circular(20),
                          //           boxShadow: [
                          //             BoxShadow(
                          //               color: Colors.grey.withOpacity(0.5),
                          //               spreadRadius: 3,
                          //               blurRadius: 10,
                          //               offset: Offset(0,3),
                          //             )
                          //           ]
                          //       ),
                          //       child: Icon(
                          //         Iconsax.add,
                          //         size: 18,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Text(
                            '\u{20B9}$price'
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[850]
                        ),
                        textAlign: TextAlign.justify,

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ProductBottomBar(name: title,price: price,imageUrl: imageUrl,productId: productId,description: description,),
      ),
    );
  }
}
