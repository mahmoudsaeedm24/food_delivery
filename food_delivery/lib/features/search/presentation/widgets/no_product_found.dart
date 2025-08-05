import 'package:flutter/material.dart';
import 'package:food_delivery/core/theme/my_text_styles.dart';

class NoProductFound extends StatelessWidget {
  const NoProductFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
mainAxisSize: MainAxisSize.min,
spacing: 20,
      children: [
        
        Icon(Icons.find_in_page, size: 80),
        Text(
          "We couldn't find any result!",
          style: MyTextStyles.textHeadline3Style,
        ),
        Text(
          "Please check your search for any typos or spelling errors, or try a different search term.",
        
        softWrap: true,),
      ],
    );
  }
}
