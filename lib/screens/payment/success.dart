import 'package:craft_corner/screens/payment/empty_section.dart';
import 'package:craft_corner/screens/payment/subTitle.dart';
import 'package:craft_corner/widgets/navigation_menu.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({super.key});
  @override
  State<Success> createState() => _SuccessState();
}
class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const EmptySection(
            emptyImg: "assets/image/success.gif",
            emptyMsg: 'Successful !!',
          ),
          const SubTitle(
            subTitleText: 'Your payment was done successfully',
          ),
          Container(
            height: 48,
            margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NavigationMenu()));
              },
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                  "Done",
                  style: TextStyle(color: Colors.white)
              ),
            ),
          ),
        ],
      ),
    );
  }
}