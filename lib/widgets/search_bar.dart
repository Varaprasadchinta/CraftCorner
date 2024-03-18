import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../constants/sizes.dart';


class CSearchContainer extends StatelessWidget {
  const CSearchContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: cDefaultSpace),
      child: Container(
        width: Sizes.getScreenWidth(context),
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(cCardRadiusLg),
            border: Border.all(color: Colors.grey)
        ),
        child: Row(
          children: [
            Icon(Iconsax.search_normal, color: Colors.grey[900],),
            const SizedBox(width: cSpaceBtwitems,),
            Text('Search',style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
      ),
    );
  }
}