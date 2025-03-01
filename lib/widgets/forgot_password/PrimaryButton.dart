
import 'package:flutter/material.dart';

import '../themes/theme.dart';


class PrimaryButton extends StatelessWidget{
  final String buttonText;
  PrimaryButton({super.key, required this.buttonText});
  @override
  Widget build(BuildContext context) {
   return Container(
     alignment: Alignment.center,
     height: MediaQuery.of(context).size.height *0.08,
     width: double.infinity,

     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(16),
       color: kPrimaryColor,

     ),
     child: InkWell(
       onTap: (){

       },
       child: Text(
           buttonText,
         style: textButton.copyWith(color: kWhiteColor),
       ),
     ),
   );
  }

}