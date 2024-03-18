import 'package:craft_corner/provider/cart_provider.dart';
import 'package:craft_corner/provider/user_provider.dart';
import 'package:craft_corner/provider/wish_list_provider.dart';
import 'package:craft_corner/screens/artisians/providers/artisan_provider.dart';
import 'package:craft_corner/screens/welcome/welcome_screen.dart';
import 'package:craft_corner/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: "AIzaSyBZNrOP5Uobz8h3nxG_aSKiK7jMh32-gHk",
    appId: "1:396546999248:android:04049fcda271f309096fd5",
    messagingSenderId: "396546999248",
    projectId: "epics-476d9",
    storageBucket: "epics-476d9.appspot.com",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (_)=> UserProvider(),
        ),
        ChangeNotifierProvider<CartProvider>(
          create: (_)=> CartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (_)=> WishListProvider(),
        ),
        ChangeNotifierProvider<ArtianProvider>(
          create: (_)=> ArtianProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CAppTheme.lightTheme,
        darkTheme: CAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const WelcomeScreen(),
        ),
    );
  }
}
