import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/screens/home/product_widget.dart';
// import 'package:craft_corner/screens/home/product_widget.dart';
import 'package:craft_corner/widgets/app_bar.dart';
import 'package:craft_corner/widgets/rounded_image.dart';
import 'package:craft_corner/widgets/search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
// import 'package:craft_corner/screens/products/product_list_screen.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}  
class _HomePageState extends State<HomePage> {
  String? sname;
  String? email;
  @override
  void initState(){
    super.initState();
    getUserDetails();
  }
  Future<void> getUserDetails() async{
    try{
      User? user = FirebaseAuth.instance.currentUser;
      DocumentSnapshot<Map<String, dynamic>> users = await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
      String cname = users['name'];
      String cemail = users['email'];
      setState(() {
        sname=cname;
        email=cemail;
      });
    }catch(e){
      print("error while getting details $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  CAppBar(name: sname,),
                  const CSearchContainer(),
                  const SizedBox(height: cSpaceBtwSections,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                //CRoundedImage
                child:
                    Column(
                      children: [
                        //promo banner
                        CarouselSlider(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            autoPlay: true,
                          ),
                          items: const [
                            //banner-1
                            CRoundedImage(imageUrl: poster2,),
                            CRoundedImage(imageUrl: poster1,),
                            CRoundedImage(imageUrl: poster3,),
                          ],
                        ),
                        const SizedBox(height: cSpaceBtwSections,),
                        ProductWidget(),
                      ],
                    ),
                ),
             ]
          )
        )
      ),
    );
  }
}



