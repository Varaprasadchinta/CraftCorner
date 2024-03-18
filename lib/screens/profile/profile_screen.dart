import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/models/users.dart';
import 'package:craft_corner/screens/order/order.dart';
import 'package:craft_corner/screens/profile/profile_menu.dart';
import 'package:craft_corner/screens/welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Future<UserDetails>? _user;
  @override
  void initState() {
    // updateData();
    super.initState();
    _user = getUserDetails();

  }

  // updateData() async{
  //   UserProvider userProvider = Provider.of(context,listen: false);
  //   await userProvider.refresherUser();
  // }
  Future<void> _logout() async{
    try{
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        );
    }catch(e){
      print("Signout error : $e");
    }
  }

  Future<UserDetails> getUserDetails() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final docSnapshot = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    if (docSnapshot.exists) {
      return UserDetails(
        userId: user.uid,
        name: docSnapshot.data()!['name'],
        email: docSnapshot.data()!['email'],
        // profilePicUrl: docSnapshot.data()!['profilePicUrl'],
      );
    }else{
      return UserDetails(
        userId: "",
        name: "",
        email: "",
    );
    }
  } else {
    // Handle null user case
    return UserDetails(
        userId: "",
        name: "",
        email: "",
    );
  }
}



  @override
  Widget build(BuildContext context) {

    // UserDetails? userDetails = Provider.of<UserProvider>(context).getUser;

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios),),
        title: Text("Profile", style: Theme.of(context).textTheme.headline4,),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(isDark ? Icons.mood : Icons.mood),
          ),
        ],
      ),
      body: FutureBuilder<UserDetails>(
        future: _user,
        builder: (context, snapshot){
          if(snapshot.hasData){
            final user = snapshot.data!;
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: (){
                            // pickImage();
                          },
                          child: Image(
                            image: AssetImage("assets/image/profile.jpg"),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(user.name, style: Theme.of(context).textTheme.headline4,),
                    Text(user.email, style: Theme.of(context).textTheme.bodyText2,),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: (){},
                        style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                        child: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(title:"Settings", icon :Icons.settings,onPress: (){},),
                    ProfileMenuWidget(title:"My cart ", icon :Icons.add_shopping_cart,onPress: (){},),
                    ProfileMenuWidget(title:"My Orders", icon :Icons.card_travel_outlined,onPress: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderScreen()));},),
                    const Divider(),
                    const SizedBox(height: 10),
                    ProfileMenuWidget(
                      title:"Logout",
                      icon :Icons.exit_to_app_sharp,
                      textColor: Colors.red,
                      endIcon: false,
                      onPress: (){
                        _logout();
                      },
                    ),
                  ],
                ),
              ),
            );
          }
           else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        )
    );
  }
}






// SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: 120,
//                 height: 120,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(100),
//                   child: InkWell(
//                     onTap: (){
//                       // pickImage();
//                     },
//                     child: Image(
//                       image: AssetImage("assets/image/profile.jpg"),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text("userDetails!.name", style: Theme.of(context).textTheme.headline4,),
//               Text("userDetails.email", style: Theme.of(context).textTheme.bodyText2,),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: 200,
//                 child: ElevatedButton(
//                   onPressed: (){},
//                   style:ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     side: BorderSide.none,
//                     shape: const StadiumBorder()),
//                   child: const Text("Edit Profile", style: TextStyle(color: Colors.white)),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Divider(),
//               const SizedBox(height: 10),
//               ProfileMenuWidget(title:"Settings", icon :Icons.settings,onPress: (){},),
//               ProfileMenuWidget(title:"My cart ", icon :Icons.add_shopping_cart,onPress: (){},),
//               ProfileMenuWidget(title:"My Orders", icon :Icons.card_travel_outlined,onPress: (){},),
//               const Divider(),
//               const SizedBox(height: 10),
//               ProfileMenuWidget(
//                 title:"Logout",
//                 icon :Icons.exit_to_app_sharp,
//                 textColor: Colors.red,
//                 endIcon: false,
//                 onPress: (){
//                   _logout();
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),