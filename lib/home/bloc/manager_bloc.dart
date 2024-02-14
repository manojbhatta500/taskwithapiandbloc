import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:taskapibloc/home/model/dish_model_class.dart';
import 'package:taskapibloc/home/repository/get_data_repository.dart';

part 'manager_event.dart';
part 'manager_state.dart';

class ManagerBloc extends Bloc<ManagerEvent, DataState> {
  GetDataRepository manager = GetDataRepository();
  ManagerBloc() : super(DataLoading()) {
    on<FetchData>(_fetchData);
  }

  FutureOr<void> _fetchData(FetchData event, Emitter<DataState> emit) async {
    var inputCurrentIndex = event.userCurrentindex;

    List<String> blocHeadingList = [];
    try {
      List<DishModelClass> blocClassdishlist =
          await manager.fetchdatafromserver();

      for (var dish in blocClassdishlist) {
        for (var product in dish.products!) {
          blocHeadingList.add(product.name!);
        }
      }

      emit(DataFetchedSuccess(
          dishList: blocClassdishlist,
          currentIndex: inputCurrentIndex,
          headingList: blocHeadingList));
    } catch (e) {
      print('Error fetching data: $e');
      emit(DataFetchedFailed());
    }
  }
}
