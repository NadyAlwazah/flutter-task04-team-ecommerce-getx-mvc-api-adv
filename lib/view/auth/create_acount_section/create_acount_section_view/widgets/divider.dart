import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white,

      indent: 120,
      endIndent: 120,
      radius: BorderRadius.circular(4),
      thickness: 4,

      // indent: 4
    );
  }
}
