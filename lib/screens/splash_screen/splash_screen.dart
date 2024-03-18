import 'package:craft_corner/constants/colors.dart';
import 'package:craft_corner/constants/image_strings.dart';
import 'package:craft_corner/constants/sizes.dart';
import 'package:craft_corner/constants/text_strings.dart';
import 'package:flutter/material.dart';

import '../welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  bool animate = false;


  // @override
  // void initState() {
  //   startAnimation();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: 80,
            left: animate ? cDefaultSize : -80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cAppName,style: Theme.of(context).textTheme.displaySmall,),
                Text(cAppTagLine,style: Theme.of(context).textTheme.displayMedium,)

              ],
            )
          ),
          Positioned(
              bottom: 100,
              child: Image(image: AssetImage(cSplashImage),width: double.maxFinite,height: double.maxFinite,),
          ),
          Positioned(
              bottom: 40,
              right: cDefaultSize,
              child: Container(
                // width: cSplashContainerSize,
                // height: cSplashContainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: cPrimaryColor,
                ),
              )
          )
        ],
      ),
    );
  }

  Future startAnimation() async{
    await Future.delayed(Duration(milliseconds: 500));
    setState(() => animate=true);
    await Future.delayed(Duration(milliseconds: 5000));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }
}
