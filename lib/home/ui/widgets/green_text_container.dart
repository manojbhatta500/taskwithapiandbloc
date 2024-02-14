import 'package:flutter/material.dart';
import 'package:taskapibloc/home/util/util.dart';

class GreenTextContainer extends StatelessWidget {
  const GreenTextContainer({super.key, required this.inputKeyword});

  final String inputKeyword;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xff43A455), width: 2)),
      child: Text(
        inputKeyword,
        style: greenText,
      ),
    );
  }
}
