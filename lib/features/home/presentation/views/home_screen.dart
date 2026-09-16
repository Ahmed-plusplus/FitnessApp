import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/widgets/app_bottom_navigation_bar.dart';
import '../../../../core/shared/widgets/app_list_screen_body.dart';
import '../../../../core/constants/app_strings.dart';
import '../viewmodels/home_state.dart';
import '../viewmodels/home_view_model.dart';
import 'widgets/featured_plans_section.dart';
import 'widgets/home_app_bar.dart';

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
            appBar: const HomeAppBar(),
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
              ),
            ),
          );
        },
      ),
    );
  }
}
