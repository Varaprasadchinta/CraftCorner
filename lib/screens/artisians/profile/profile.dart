import 'package:craft_corner/screens/profile/profile_menu.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          leading : null,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
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
                Text("Vallakati Navyasri", style: Theme.of(context).textTheme.headline4,),
                Text("navya@gmail.com", style: Theme.of(context).textTheme.bodyText2,),
                const SizedBox(height: 20),
                const Divider(), 
                const SizedBox(height: 10),
                //MENUProfileMenuWidget(title:"My cart ", icon :Icons.add_shopping_cart,onPress: (){},),
                ProfileMenuWidget(title:"My Products", icon : Icons.card_travel_outlined,onPress: (){},),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                  title:"Logout",
                  icon :Icons.exit_to_app_sharp,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: (){},
                ),
              ],
            ),
          ),
        ),
    );
  }
}