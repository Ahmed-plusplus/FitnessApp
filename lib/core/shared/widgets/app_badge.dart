import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  final Color color;
  final Widget child;

  const AppBadge({required this.color, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.16),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
