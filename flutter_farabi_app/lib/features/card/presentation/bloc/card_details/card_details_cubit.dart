

import 'package:bloc/bloc.dart';
import 'package:flutter_farabi_app/core/networking/card_network.dart';
import 'package:meta/meta.dart';

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
   

    if (response.statusCode == 200) {
      var username =
          "${response.data['userCard']['firstname']} ${response.data['userCard']['lastname']}";

      String fullName = capitalizeFirstLetterOfEachWord(username.toString());
    
      var cardNumber = response.data['userCard']['cardNumber'];
      var id = response.data['userCard']['_id'];
      emit(CardDetailsLoaded(
          fullName: fullName, cardNumber: cardNumber, id: id));
    }
  }
}
