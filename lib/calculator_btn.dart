import 'package:flutter/material.dart';
import 'app_colors.dart';

typedef OnButtonClick =  void Function(String);
class CalculatorButton extends StatelessWidget {

  Color backgroundColor;
  int flex;
  String text;
  Color colorText;
  bool isBackSpaceIcon;
  OnButtonClick onButtonClick;

  CalculatorButton({this.backgroundColor = AppColors.darkGreyColor,
  this.flex = 1,
    required this.text,
    required this.onButtonClick,
    this.colorText = AppColors.lightBlueColor,
    this.isBackSpaceIcon = false
  });

  @override
  Widget build(BuildContext context) {
   return Expanded(
     flex: flex,
     child: Padding(
       padding: const EdgeInsets.symmetric(
         horizontal: 8,
         vertical: 8,
       ),
       child: FloatingActionButton(
         onPressed: (){
           // todo: logic
           onButtonClick(text);
         },
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
         backgroundColor: backgroundColor,
         child: isBackSpaceIcon ?
         Icon(Icons.backspace,color: AppColors.lightGreyColor,)
             :
         Text(text,
           style: TextStyle(
             fontSize: 35,
             fontWeight: FontWeight.w600,
             color: colorText
           ),
         ),
       ),
     ),
   );
  }
}