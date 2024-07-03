// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../../../data/repository/card_repository.dart';

part 'create_e_card_state.dart';

class CreateECardCubit extends Cubit<CreateECardState> {
  final CardRepository cardRepository;
  CreateECardCubit(this.cardRepository) : super(CreateECardInitial());

  Future<void> createECard() async {
    emit(CreateECardLoading());

    var response = await cardRepository.createECard();
   
    if (response == "erreur inattendue") {
      emit(CreateECardError(stringError: response.toString()));
      
    } else if (response == "ok") {
      emit(CreateECardLoaded());

     
    } else {
      emit(CreateECardError(stringError: response.toString()));
      
    }
  }
}
