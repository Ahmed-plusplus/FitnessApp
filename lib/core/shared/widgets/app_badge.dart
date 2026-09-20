import 'package:flutter/material.dart';

class AppBadge extends StatelessWidget {
  final Color color;
  final Widget child;

  /// Uses [color] as a solid background instead of the default translucent tint.
  final bool filled;
  final EdgeInsetsGeometry padding;

  const AppBadge({
    required this.color,
    required this.child,
    this.filled = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: filled ? color : color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(4),
      ),
      child: child,
    );
  }
}
