import 'package:flutter/material.dart';

const labeltextstyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});
  final IconData? icon;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: const Color(0xFF98D8E98),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label ?? '',
          style: TextStyle(
            fontSize: 30.0,
            color: Color(0xFF8D898),
          ),
        ),
      ],
    );
  }
}
