import 'package:flutter/material.dart';

class LoadCircle extends StatelessWidget {
  const LoadCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      strokeWidth: 6,
      );
  }
}

