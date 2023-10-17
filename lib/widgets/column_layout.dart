import 'package:booktickets/utils/app_layout.dart';
import 'package:booktickets/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';

class AppColumnLayout extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String firstText;
  final String secondText;
  final bool? isColor;

  const AppColumnLayout(
      {super.key,
      required this.firstText,
      required this.secondText,
      required this.alignment,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: alignment,
      crossAxisAlignment: alignment,
      children: [
        Text(
          firstText,
          style: isColor == null
              ? Styles.headlineStyle3.copyWith(color: Colors.white)
              : Styles.headlineStyle3,
        ),
        Gap(AppLayout.getHeight(5)),
        Text(
          secondText,
          style: isColor == null
              ? Styles.headlineStyle4.copyWith(color: Colors.white)
              : Styles.headlineStyle4,
        )
      ],
    );
  }
}
