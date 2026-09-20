import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/shared/widgets/app_bottom_navigation_bar.dart';
import '../../../../core/shared/widgets/app_list_screen_body.dart';
import '../viewmodels/trainers_state.dart';
import '../viewmodels/trainers_view_model.dart';
import 'widgets/trainers_app_bar.dart';
import 'widgets/trainers_section.dart';

class TrainersScreen extends StatefulWidget {
  final TrainersViewModel viewModel;

  const TrainersScreen({required this.viewModel, super.key});

  @override
  State<TrainersScreen> createState() => _TrainersScreenState();
}

class _TrainersScreenState extends State<TrainersScreen> {
  TrainersViewModel get viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    viewModel.loadTrainers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrainersViewModel>(
      create: (_) => viewModel,
      child: BlocConsumer<TrainersViewModel, TrainersState>(
        listener: (context, state) {
          if (state.status == TrainersStatus.failure && state.errorMessage != null) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const TrainersAppBar(),
            bottomNavigationBar: const AppBottomNavigationBar(currentIndex: 1),
            body: AppListScreenBody(
              searchHint: AppStrings.searchTrainersHint,
              isLoading: state.isLoading,
              hasData: state.trainers.isNotEmpty,
              onRefresh: viewModel.loadTrainers,
              onSearchChanged: viewModel.search,
              child: TrainersSection(trainers: state.visibleTrainers),
            ),
          );
        },
      ),
    );
  }
}
