import 'package:flutter/material.dart';

// import '../../../constants/image_strings.dart';
import '../../../constants/text_strings.dart';


class ArtisianLoginHeaderWidget extends StatelessWidget {
  const ArtisianLoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image(
        //   image: AssetImage(cWelcomeImage),
        //   height: size.height*0.2,
        // ),
        const SizedBox(height: 50,),
        Text(cLoginTitle,style: Theme.of(context).textTheme.headlineLarge,),
        Text(cLoginSubtitle,style: Theme.of(context).textTheme.bodyLarge,),
      ],
    );
  }
}