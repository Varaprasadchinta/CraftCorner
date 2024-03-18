import 'package:craft_corner/constants/image_strings.dart';
import 'package:craft_corner/constants/sizes.dart';
import 'package:craft_corner/constants/text_strings.dart';
import 'package:craft_corner/screens/artisians/artisianSignup/signup_form_widget.dart';
import 'package:craft_corner/screens/artisians/artisiansLogin/login_screen.dart';
// import 'package:craft_corner/screens/login/login_screen.dart';
// import 'package:craft_corner/screens/signup/signup_form_widget.dart';
// import 'package:craft_corner/screens/signup/signup_form_widget.dart';
import 'package:craft_corner/widgets/form_header_widget.dart';
import 'package:flutter/material.dart';

class ArtisianSignUpScreen extends StatelessWidget {
  const ArtisianSignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(cDefaultSize),
            child: Column(
              children: [
                const FormHeaderWidget(
                    // image: cWelcomeImage,
                    title: cSignupTitle,
                    subTitle: cSignupSubtitle
                  ),
                const ArtisianSignupFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Image(
                          image: AssetImage(googleLogo),
                          width: 20.0,
                        ),
                        label: Text(cSignWithGoogle.toUpperCase()),
                      ),
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ArtisianLoginScreen()),
                          );
                        },
                        child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: cAlreadyHaveanAccount,style: Theme.of(context).textTheme.bodyLarge,),
                                TextSpan(text: cLogin.toUpperCase(),style: const TextStyle(color: Colors.blue))
                              ]
                            )
                        )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
