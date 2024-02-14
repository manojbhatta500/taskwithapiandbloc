part of 'manager_bloc.dart';

sealed class ManagerEvent extends Equatable {
  const ManagerEvent();

  @override
  List<Object> get props => [];
}

final class FetchData extends ManagerEvent {
  int userCurrentindex;
  FetchData({required this.userCurrentindex});
}
