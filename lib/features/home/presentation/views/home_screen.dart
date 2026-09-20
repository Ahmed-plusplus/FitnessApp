import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/route/app_routes.dart';
import '../../../../core/shared/widgets/app_branded_app_bar.dart';
import '../../../../core/shared/widgets/app_bottom_navigation_bar.dart';
import '../../../../core/shared/widgets/app_list_screen_body.dart';
import '../../../../core/constants/app_strings.dart';
import '../viewmodels/home_state.dart';
import '../viewmodels/home_view_model.dart';
import 'widgets/featured_plans_section.dart';

class HomeScreen extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreen({
    required this.viewModel,
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.loadHome();
  }

  Future<void> _openPlanDetails(int planId) async {
    await context.push(AppRoutes.planDetailsPath(planId));
    // The favorite may have changed on the details screen.
    if (mounted) viewModel.loadHome();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeViewModel>(
      create: (_) => viewModel,
      child: BlocConsumer<HomeViewModel, HomeState>(
        listener: (context, state) {
          if (state.status == HomeStatus.failure &&
              state.errorMessage != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const AppBrandedAppBar(showNotificationDot: true),
            bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 0),
            body: AppListScreenBody(
              searchHint: AppStrings.searchWorkoutsHint,
              isLoading: state.isLoading,
              hasData: state.featuredPlans.isNotEmpty,
              onRefresh: viewModel.loadHome,
              onSearchChanged: viewModel.search,
              child: FeaturedPlansSection(
                plans: state.visiblePlans,
                favoritePlanIds: state.favoritePlanIds,
                onToggleFavorite: viewModel.toggleFavorite,
                onPlanTap: _openPlanDetails,
              ),
            ),
          );
        },
      ),
    );
  }
}
