import 'package:craft_corner/constants/sizes.dart';
import 'package:craft_corner/screens/artisians/artisiansLogin/login_footer_widget.dart';
import 'package:craft_corner/screens/artisians/artisiansLogin/login_form_widget.dart';
import 'package:craft_corner/screens/artisians/artisiansLogin/login_header_widget.dart';
// import 'package:craft_corner/screens/login/login_footer_widget.dart';
// import 'package:craft_corner/screens/login/login_form_widget.dart';
// import 'package:craft_corner/screens/login/login_header_widget.dart';
import 'package:flutter/material.dart';

class ArtisianLoginScreen extends StatelessWidget {
  const ArtisianLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(cDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArtisianLoginHeaderWidget(size: size),
                ArtisianLoginForm(),
                const ArtisianLoginFooterWidget(),
              ],
            ),
          ),
        ),
    );
  }
}