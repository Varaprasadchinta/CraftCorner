import 'package:craft_corner/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: cFormHeight-20,),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: (){},
            icon: Image(image: AssetImage(googleLogo),width: 20.0,),
            label: Text(cSignWithGoogle),
          ),
        ),
        const SizedBox(
          height: cFormHeight - 20,
        ),
        TextButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpScreen())
            );
          },
          child: Text.rich(
              TextSpan(
                  text: cDontHaveAcc,
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: const[
                    TextSpan(
                      text: cSignup,
                      style: TextStyle(color: Colors.blue),
                    )
                  ]
              )
          ),
        )
      ],
    );
  }
}