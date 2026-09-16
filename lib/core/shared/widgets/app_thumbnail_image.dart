import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class AppThumbnailImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final double borderRadius;

  const AppThumbnailImage({
    required this.imageUrl,
    required this.width,
    required this.height,
    this.borderRadius = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        width: width,
        height: height,
        child: imageUrl == null
            ? Container(color: AppColors.surface)
            : Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(color: AppColors.surface),
              ),
      ),
    );
  }
}
