import 'package:craft_corner/screens/login/forgot_password.dart';
import 'package:craft_corner/widgets/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';
import 'package:craft_corner/services/auth.dart';

class LoginForm extends StatelessWidget {
   LoginForm({
    super.key,
  });
  final Authentication authentication = Authentication();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleUserLogin(BuildContext context) async {
    final String email = emailController.text;
    final String password = passwordController.text;

    try {
      // Perform authentication
      final User? user = await authentication.signInWithEmailAndPassword(email, password);

      if (user!= null) {
        // Authentication successful, navigate to the main screen (MainScreen)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => NavigationMenu()),
        );
      } else {
        // Authentication failed, display an error message
        // You can add error handling UI feedback here
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: Text('Authentication failed. Please check your credentials.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error during login: $e');
      // Handle other exceptions if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: cFormHeight-10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: cEmail,
                hintText: cEmail,
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please Enter Your Email";
                }
                return null;
              },
              // onChanged: (value){
              //   setState((){
              //     _email = value;
              //   });
              // },
            ),
            SizedBox(
              height: cFormHeight,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              // keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                  label: Text(cPass),
                  prefixIcon: Icon(Icons.lock_outline)
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please Enter Your password";
                }
                return null;
              },
              // onChanged: (value){
              //   setState((){
              //     _password = value;
              //   });
              // },
            ),
            const SizedBox(height: cFormHeight-20),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> const ForgotPasswordScreen())
                  );
                },
                child: const Text(cFPass,style: TextStyle(color: Colors.blue),),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                    handleUserLogin(context);
                  },
                child: Text(cLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}