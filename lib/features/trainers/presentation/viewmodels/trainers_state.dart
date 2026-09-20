import 'package:flutter/foundation.dart';

import '../../../../core/shared/models/trainers_model.dart';

enum TrainersStatus { initial, loading, loaded, failure }

@immutable
class TrainersState {
  final TrainersStatus status;
  final List<TrainersModel> trainers;
  final String searchQuery;
  final String? errorMessage;

  const TrainersState({this.status = TrainersStatus.initial, this.trainers = const [], this.searchQuery = '', this.errorMessage});

  bool get isLoading => status == TrainersStatus.loading;
  bool get isLoaded => status == TrainersStatus.loaded;

  List<TrainersModel> get visibleTrainers {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return trainers;
    return trainers.where((trainer) {
      final name = (trainer.name ?? '').toLowerCase();
      final specialty = (trainer.specialty ?? '').toLowerCase();
      return name.contains(query) || specialty.contains(query);
    }).toList();
  }

  TrainersState copyWith({
    TrainersStatus? status,
    List<TrainersModel>? trainers,
    String? searchQuery,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return TrainersState(
      status: status ?? this.status,
      trainers: trainers ?? this.trainers,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: clearErrorMessage ? null : (errorMessage ?? this.errorMessage),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is TrainersState &&
            other.status == status &&
            listEquals(other.trainers, trainers) &&
            other.searchQuery == searchQuery &&
            other.errorMessage == errorMessage;
  }

  @override
  int get hashCode => Object.hash(status, Object.hashAll(trainers), searchQuery, errorMessage);
}
