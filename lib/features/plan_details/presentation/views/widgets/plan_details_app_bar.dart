import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/route/app_routes.dart';
import '../../../../../core/shared/widgets/app_bar_bottom_divider.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../viewmodels/plan_details_state.dart';
import '../../viewmodels/plan_details_view_model.dart';

class PlanDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onFavoriteToggle;

  const PlanDetailsAppBar({required this.onFavoriteToggle, super.key});

  void _goBack(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    } else {
      context.go(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = AppUi.horizontalPadding(context);

    return AppBar(
      bottom: const AppBarBottomDivider(),
      leading: Center(
        child: _CircleIconButton(
          onPressed: () => _goBack(context),
          child: const Icon(Icons.arrow_back, size: 20),
        ),
      ),
      title: Text(
        AppStrings.planDetailsTitle,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: horizontalPadding),
          child: Center(
            child: BlocSelector<PlanDetailsViewModel, PlanDetailsState, bool>(
              selector: (state) => state.isFavorite,
              builder: (context, isFavorite) {
                return _CircleIconButton(
                  onPressed: onFavoriteToggle,
                  child: SvgPicture.asset(
                    AppAssets.favoritesIcon,
                    width: 20,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      isFavorite ? AppColors.primary : AppColors.textSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + AppBarBottomDivider.height);
}

class _CircleIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const _CircleIconButton({required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: child,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.card,
        foregroundColor: AppColors.textPrimary,
        fixedSize: const Size(40, 40),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
