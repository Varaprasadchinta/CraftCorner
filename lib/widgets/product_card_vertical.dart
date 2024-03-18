import 'package:craft_corner/constants/image_strings.dart';
import 'package:craft_corner/constants/sizes.dart';
import 'package:craft_corner/widgets/circular_icon.dart';
import 'package:craft_corner/widgets/product_price_text.dart';
import 'package:craft_corner/widgets/product_titile_text.dart';
import 'package:craft_corner/widgets/rounded_container.dart';
import 'package:craft_corner/widgets/rounded_image.dart';
import 'package:craft_corner/widgets/shadows.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CProductCardVertical extends StatelessWidget {
  const CProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          children: [
            //thumbnail,wishlist button,discount tag
            CRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(sm),
              backgroundColor: Colors.white,
              child: Stack(
                children: [
                  //Thumbnail Image
                  const CRoundedImage(imageUrl: cWelcomeImage,applyImageRadius: true,),

                  //Sale Tag
                  Positioned(
                    top: 12,
                    child: CRoundedContainer(
                      radius: sm,
                      backgroundColor: Colors.yellow.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: sm,vertical: xs),
                      child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: Colors.black)),
                    ),
                  ),

                  //favourite Icon Button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: CCircularIcon(
                        icon: Iconsax.heart5, color: Colors.red,
                      )
                  )
                ],
              ),
            ),

            const SizedBox(height: cSpaceBtwitems/2,),

            //Details
            Padding(
                padding: const EdgeInsets.only(left: sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CProductTitleText(title: 'A famous kondapally toy', smallSize: true,),
                    const SizedBox(height: cSpaceBtwitems/2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //price
                        const CProductPriceText(price: '700'),

                        //cart button
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cCardRadiusMd),
                              bottomRight: Radius.circular(cProductImageRadius),
                            ),
                          ),
                          child: const SizedBox(
                              width: cIconLg*1.2,
                              height: cIconLg*1.2,
                              child: Center(child: Icon(Iconsax.add, color: Colors.white))
                          ),
                        )
                      ],
                    )
                  ],
                ),
            )
          ],
        ),
      ),
    );
  }
}


