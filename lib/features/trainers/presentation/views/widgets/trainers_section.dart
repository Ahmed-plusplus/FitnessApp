import 'package:flutter/material.dart';

import '../../../../../core/constants/app_strings.dart';
import '../../../../../core/shared/models/trainers_model.dart';
import '../../../../../core/shared/widgets/app_entity_list_view.dart';
import 'trainer_card.dart';

class TrainersSection extends StatelessWidget {
  final List<TrainersModel> trainers;

  const TrainersSection({required this.trainers, super.key});

  @override
  Widget build(BuildContext context) {
    return AppEntityListView<TrainersModel>(
      items: trainers,
      emptyMessage: AppStrings.noTrainers,
      itemBuilder: (context, trainer) => TrainerCard(trainer: trainer),
    );
  }
}
