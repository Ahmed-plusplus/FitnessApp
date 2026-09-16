import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class AppBarBottomDivider extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarBottomDivider({super.key});

  static const double height = 1;

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.divider,
      child: SizedBox(height: height, width: double.infinity),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
