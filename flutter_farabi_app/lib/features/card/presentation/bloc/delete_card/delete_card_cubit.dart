

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/card_network.dart';

part 'delete_card_state.dart';

class DeleteCardCubit extends Cubit<DeleteCardState> {
  final CardApi cardApi;
  DeleteCardCubit(this.cardApi) : super(DeleteCardInitial());

  Future<void> deleteCard() async {
    emit(DeleteCardLoading());

    var response = await cardApi.deleteCard();
    
    if (response.statusCode == 200) {
      emit(DeleteCardLoaded());
     
    } else if (response.statusCode == 404) {
      emit(DeleteCardError(
          stringError: response.data['errors'][0]['msg'].toString()));
    }
     else {
      emit(DeleteCardError(stringError: "erreur inattendue!"));
    }
  }
}
