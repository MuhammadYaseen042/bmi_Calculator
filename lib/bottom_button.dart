import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback ontap;
  final String Btitle;
  BottomButton({required this.ontap, required this.Btitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(
            Btitle,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        color: Colors.red,
        margin: const EdgeInsets.only(top: 10.0),
        height: 80.0,
      ),
    );
  }
}
