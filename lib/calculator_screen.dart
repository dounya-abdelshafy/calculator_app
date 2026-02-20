import 'package:flutter/material.dart';
import 'package:session03_calculator/app_colors.dart';
import 'package:session03_calculator/calculator_btn.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = "CalculatorScreen";

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  resultText,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                onButtonClick: onClearClick,
                                text: "Ac",
                                colorText: AppColors.lightGreyColor,
                                backgroundColor: AppColors.greyColor,
                              ),
                              CalculatorButton(
                                onButtonClick: onBackSpaceClick,
                                text: "",
                                isBackSpaceIcon: true,
                                backgroundColor: AppColors.greyColor,
                              ),
                              CalculatorButton(
                                onButtonClick: onOperatorClick,
                                text: "/",
                                backgroundColor: AppColors.darkBlueColor,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "7"),
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "8"),
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "9"),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "4"),
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "5"),
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "6"),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "1"),
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "2"),
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "3"),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "0", flex: 2),
                              CalculatorButton(
                                  onButtonClick: onDigitClick,
                                  text: "."),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CalculatorButton(
                          onButtonClick: onOperatorClick,
                          text: "*",
                          flex: 2,
                          backgroundColor: AppColors.darkBlueColor,
                        ),
                        CalculatorButton(
                          onButtonClick: onOperatorClick,
                          text: "-",
                          flex: 2,
                          backgroundColor: AppColors.darkBlueColor,
                        ),
                        CalculatorButton(
                          onButtonClick: onOperatorClick,
                          text: "+",
                          flex: 4,
                          backgroundColor: AppColors.darkBlueColor,
                        ),
                        CalculatorButton(
                          onButtonClick: onEqualClick,
                          text: "=",
                          flex: 2,
                          backgroundColor: AppColors.blueColor,
                          colorText: AppColors.lightWhiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitClick(String text) {
    if(text == '.' && resultText.contains('.')) {
      return;
    }
   resultText += text;
   setState(() {});
  }

  String lhs = '';
  String operator = '';

  void onOperatorClick(String clickedOperator) {
    if(operator.isEmpty)
      {
        lhs = resultText;
        // operator = clickedOperator;
        // resultText = '';
      }else {
      String rhs = resultText;
      lhs = calculate(lhs,operator,rhs);
      // operator = clickedOperator;
      // resultText = '';
    }
    operator = clickedOperator;
    resultText = '';
    setState(() {});
  }

  void onEqualClick(String text){
    String rhs = resultText;
    resultText = calculate(lhs,operator,rhs);
    lhs = '';
    operator = '';
    setState(() {});
  }

  void onClearClick(String _) {
    resultText = '';
    lhs = '';
    operator = '';
    setState(() {});
  }
  
  void onBackSpaceClick(String _) {
    if(resultText.isEmpty){
      return;
    }
    resultText = resultText.substring(0 , resultText.length - 1);
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0;
    if(operator == '+'){
      res = num1 + num2;
    }else if(operator == '-'){
      res = num1 - num2;
    }else if(operator == '*'){
      res = num1 * num2;
    }else if(operator == '/') {
      res = num1 / num2;
    }
    return res.toString();
  }


}
