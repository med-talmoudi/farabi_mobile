// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter_farabi_app/features/card/data/repository/card_repository.dart';
import 'package:meta/meta.dart';

part 'insert_card_state.dart';

class InsertCardCubit extends Cubit<InsertCardState> {
  final CardRepository cardRepository;
  InsertCardCubit(this.cardRepository) : super(InsertCardInitial());

  Future<void> getUser() async {
    emit(InsertCardLoading());

    var response = await cardRepository.getUser();
    print(response);
    if (response == "erreur inattendue") {
      emit(InsertCardError(stringError: response.toString()));
      print(response.toString());
    } else if (response == "ok") {
      emit(InsertCardLoaded());

     
    } else {
      emit(InsertCardError(stringError: response.toString()));
      
    }
  }

}
