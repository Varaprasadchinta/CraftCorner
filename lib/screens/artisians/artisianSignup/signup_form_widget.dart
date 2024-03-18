import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craft_corner/constants/sizes.dart';
import 'package:craft_corner/constants/text_strings.dart';
import 'package:craft_corner/services/auth.dart';
import 'package:craft_corner/widgets/artisian_navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ArtisianSignupFormWidget extends StatefulWidget {
  const ArtisianSignupFormWidget({super.key});

  @override
  State<ArtisianSignupFormWidget> createState() => _ArtisianSignupFormWidgetState();
}

class _ArtisianSignupFormWidgetState extends State<ArtisianSignupFormWidget> {
  final Authentication authentication = Authentication();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController storeNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isRegistering = false;

  Future<void> handleRegistration(BuildContext context) async {
    final String name = nameController.text;
    final String storeName = storeNameController.text;
    final String email = emailController.text;
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    try {
      if (password == confirmPassword) {
        setState(() {
          isRegistering = true;
        });
        // Perform user registration
        final User? user = await authentication.signUpWithEmailAndPassword(email, password);

        if (user != null) {
          // Registration successful, navigate to the details collection screen
          
          await FirebaseFirestore.instance.collection('artisians').doc(user.uid).set({
            'name' : name,
            'email' : email,
            'storeId' : user.uid,
            'storeName' : storeName, 
          });


          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ArtisianNavigationBarApp(),
            ),
          );
        } else {
          // Registration failed, display an error message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration failed. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      } else {
        // Passwords do not match, display an error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Passwords do not match.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error during registration: $e');
      // Handle other exceptions if needed
    }
  }

  // Future createUser({required String name}) async{
  //   final docUser = FirebaseFirestore.instance.collection('users').doc('1');
  //   final json={
  //     'name':name,
  //     'email':'email@gmail.com',
  //   };
  //   await docUser.set(json);
  // }

  // get emailController => null;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: cFormHeight - 10),
      child: Form(
        // key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  label: Text(cFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please Enter Your Name";
                }
                return null;
              },
            ),
            const SizedBox(
              height: cFormHeight - 20,
            ),
            TextFormField(
              controller: storeNameController,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                  label: Text("Store Name"),
                  prefixIcon: Icon(Icons.store_outlined)
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please Enter Your Store Name";
                }
                return null;
              },
            ),
            const SizedBox(
              height: cFormHeight - 20,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  label: Text(cEmail),
                  prefixIcon: Icon(Icons.email_outlined)
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please Enter Your Email";
                }
                return null;
              },
            ),
            const SizedBox(
              height: cFormHeight - 20,
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
            ),
            const SizedBox(
              height: cFormHeight - 20,
            ),
            TextFormField(
              controller: confirmPasswordController,
              obscureText: true,
              // keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                  label: Text(cCPass),
                  prefixIcon: Icon(Icons.lock_outline)
              ),
              validator: (value){
                if(value == null || value.isEmpty){
                  return "Please Enter Your password";
                }
                return null;
              },
            ),
            const SizedBox(
              height: cFormHeight - 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isRegistering ? null : () => handleRegistration(context),
                child: isRegistering ? const CircularProgressIndicator() : Text(cSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}






