import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../viewmodels/plan_details_state.dart';
import '../viewmodels/plan_details_view_model.dart';
import 'widgets/plan_details_app_bar.dart';
import 'widgets/plan_details_body.dart';

class PlanDetailsScreen extends StatefulWidget {
  final PlanDetailsViewModel viewModel;
  final int planId;

  const PlanDetailsScreen({
    required this.viewModel,
    required this.planId,
    super.key,
  });

  @override
  State<PlanDetailsScreen> createState() => _PlanDetailsScreenState();
}

class _PlanDetailsScreenState extends State<PlanDetailsScreen> {
  PlanDetailsViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.loadPlan(widget.planId);
  }

  Future<void> _retry() => viewModel.loadPlan(widget.planId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanDetailsViewModel>(
      create: (_) => viewModel,
      child: BlocListener<PlanDetailsViewModel, PlanDetailsState>(
        listenWhen: (previous, current) =>
            previous.errorMessage != current.errorMessage &&
            current.errorMessage != null,
        listener: (context, state) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
        },
        child: Scaffold(
          appBar: PlanDetailsAppBar(
            onFavoriteToggle: viewModel.toggleFavorite,
          ),
          body: PlanDetailsBody(
            onRetry: _retry,
            onToggleDay: viewModel.toggleDay,
            onStartWorkout: () {
            },
          ),
        ),
      ),
    );
  }
}
