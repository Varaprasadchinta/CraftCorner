import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/constants/sizes.dart';
import 'package:craft_corner/screens/artisians/posts/posts_screen.dart';
import 'package:craft_corner/screens/profile/profile_menu.dart';
import 'package:craft_corner/screens/welcome/welcome_screen.dart';
// import 'package:craft_corner/services/auth.dart';
// import 'package:craft_corner/widgets/app_bar.dart';
import 'package:craft_corner/widgets/artisian_app_bar.dart';
// import 'package:craft_corner/widgets/search_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  String? name;
  String? email;
  String? storeName;
  Future<void> getArtisanDetails() async{
    try{
      User? user = FirebaseAuth.instance.currentUser;
      DocumentSnapshot<Map<String, dynamic>> artisan = await FirebaseFirestore.instance.collection('artisians').doc(user?.uid).get();
      String cname = artisan['name'];
      String cemail = artisan['email'];
      String cstoreName = artisan['storeName'];
      setState(() {
        name=cname;
        email=cemail;
        storeName=cstoreName;
      });
    }catch(e){
      print("error while getting details $e");
    }
  }
  
  @override
  Widget build(BuildContext context) {
    getArtisanDetails();
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Column(
                children: [
                  ArtisianAppBar(name: "Dashboard",),
                  // CSearchContainer(),
                  SizedBox(height: cSpaceBtwSections,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: const Image(
                              image: AssetImage("assets/image/store1.jpg"),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black.withOpacity(0.1),
                            ),
                            child: const Icon(Icons.edit,size: 18.0, color:Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text( "$storeName", style: Theme.of(context).textTheme.headlineMedium,),
                    Text( "$name", style: Theme.of(context).textTheme.bodyLarge,),
                    Text("$email", style: Theme.of(context).textTheme.bodyMedium,),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                      title:"My Products",
                      icon : Icons.card_travel_outlined,
                      onPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PostsScreen())
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                      title:"My orders",
                      icon :Icons.add_shopping_cart_outlined,
                      onPress: (){},
                    ),
                    ProfileMenuWidget(
                      title:"Log out",
                      textColor: Colors.red,
                      icon :Icons.logout_outlined,
                      endIcon: false,
                      onPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const WelcomeScreen())
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
    );
  }
}