part of 'manager_bloc.dart';

sealed class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

final class DataLoading extends DataState {}

class DataFetchedSuccess extends DataState {
  List<DishModelClass> dishList;

  DataFetchedSuccess(
      {required this.dishList,
      required this.currentIndex,
      required this.headingList});
  List<String> headingList;
  int currentIndex = 0;

  @override
  List<Object> get props => [dishList, currentIndex, headingList];
}

final class DataFetchedFailed extends DataState {}
