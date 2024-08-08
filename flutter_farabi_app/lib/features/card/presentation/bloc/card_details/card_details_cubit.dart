import 'package:bloc/bloc.dart';
import 'package:flutter_farabi_app/core/networking/card_network.dart';
import 'package:meta/meta.dart';

import '../../../../../main.dart';

part 'card_details_state.dart';

class CardDetailsCubit extends Cubit<CardDetailsState> {
  final CardApi cardApi;
  CardDetailsCubit(this.cardApi) : super(CardDetailsInitial());

  String capitalizeFirstLetterOfEachWord(String str) {
    return str.split(' ').map((word) {
      if (word.isEmpty) return word;
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).join(' ');
  }

  Future<void> cardDetails() async {
    emit(CardDetailsLoading());
    await Future.delayed(const Duration(seconds: 0));

    var response = await cardApi.cardDetails();
  

    if (response.statusCode == 200 ) {

        if (response.data['card'] != null) {
      var username =
          "${response.data['card']['firstname']} ${response.data['card']['lastname']}";

      String fullName = capitalizeFirstLetterOfEachWord(username.toString());

      var cardNumber = response.data['card']['cardNumber'];
      var id = response.data['card']['_id'];
      box!.put("id", id);
      emit(CardDetailsLoaded(
          fullName: fullName, cardNumber: cardNumber, id: id));
    }else {
       emit(CardDetailsError(
          errorString:"no card exist", statusCode: response.statusCode));
    } }else if (response.statusCode != 200 && response.statusCode != 500){
      print(response.statusCode.runtimeType);
      emit(CardDetailsError(
          errorString: response.data['errors'][0]['msg'].toString(), statusCode: response.statusCode));
    } else {
      emit(CardDetailsError(errorString: "erreur inattendue!", statusCode:  500));
    }
  }
}
