import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/shared/models/plans_model.dart';
import '../../../../core/shared/widgets/app_bottom_navigation_bar.dart';
import '../../../../core/shared/widgets/app_branded_app_bar.dart';
import '../../../../core/shared/widgets/app_entity_list_view.dart';
import '../../../../core/theme/app_theme.dart';
import '../viewmodels/plans_state.dart';
import '../viewmodels/plans_view_model.dart';
import 'widgets/plan_list_card.dart';

class PlansScreen extends StatefulWidget {
  final PlansViewModel viewModel;

  const PlansScreen({
    required this.viewModel,
    super.key,
  });

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  PlansViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.loadPlans();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final horizontalPadding = AppUi.horizontalPadding(context);

    return BlocProvider<PlansViewModel>(
      create: (_) => viewModel,
      child: BlocConsumer<PlansViewModel, PlansState>(
        listener: (context, state) {
          if (state.status == PlansStatus.failure &&
              state.errorMessage != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const AppBrandedAppBar(),
            bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 2),
            body: SafeArea(
              child: state.isLoading && state.plans.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      onRefresh: viewModel.loadPlans,
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          8,
                          horizontalPadding,
                          24,
                        ),
                        children: [
                          Text(
                            AppStrings.findYourPlanTitle,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(height: screenWidth * 0.06),
                          AppEntityListView<PlansModel>(
                            items: state.plans,
                            emptyMessage: AppStrings.noPlansAvailable,
                            itemBuilder: (context, plan) =>
                                PlanListCard(plan: plan),
                          ),
                        ],
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
