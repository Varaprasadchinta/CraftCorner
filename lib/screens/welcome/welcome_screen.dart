import 'package:craft_corner/constants/image_strings.dart';
import 'package:craft_corner/constants/sizes.dart';
import 'package:craft_corner/constants/text_strings.dart';
import 'package:craft_corner/screens/artisians/artisiansLogin/login_screen.dart';
import 'package:flutter/material.dart';
import '../login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(cDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: const AssetImage(cWelcomeImage),height: height*0.6,),
            Column(
              children: [
                Text(
                  cAppName,
                  style: Theme.of(context).textTheme.displaySmall,

                ),
                Text(
                  cAppTagLine,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                
              ],
            ),

            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ArtisianLoginScreen()),
                          );
                        },
                        child: Text("Artisian".toUpperCase())
                    )
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        },
                        child: Text("CUSTOMER".toUpperCase())
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
