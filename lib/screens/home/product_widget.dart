import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

// import '../products/productDisplay.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> list1 = ["Bullok cart","bride & groom","couple","farming and bullock cart","lord Rama","Dancing doll",];
    List<String> list2 = ["1200","1500","1500","2000","1800","2000"];
    return GridView.count( 
      childAspectRatio: 0.72,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for(int i=1;i<=6;i++)
          Container(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
            margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ProductDisplay()),
                    // );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(0),
                    child: Image(
                      image: AssetImage("assets/products/$i.jpg"),
                      height: 100,
                      width: 110,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Container(

                    alignment: Alignment.centerLeft,
                    child: Text(
                      list1[i-1],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   child: const Text(
                //     "Write description",
                //     style: TextStyle(
                //       fontSize: 14,
                //       color: Colors.black54,
                //     ),
                //     maxLines: 2,
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\u{20B9}"+list2[i-1],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      Icon(
                        Iconsax.shopping_bag
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
