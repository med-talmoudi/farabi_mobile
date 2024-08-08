import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/card_network.dart';

part 'get_username_state.dart';

class GetUsernameCubit extends Cubit<GetUsernameState> {
  final CardApi cardApi;
  GetUsernameCubit(this.cardApi) : super(GetUsernameInitial());

  String capitalizeFirstLetterOfEachWord(String str) {
    return str.split(' ').map((word) {
      if (word.isEmpty) return word;
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).join(' ');
  }

  Future<void> getUsername() async {
    emit(GetUsernameLoading());

    var response = await cardApi.getProfile();

    if (response.statusCode == 200) {

     var username = 
    "${response.data['firstname']} ${response.data['lastname']}";


      String fullName = capitalizeFirstLetterOfEachWord(username.toString());

      emit(GetUsernameLoaded(fullName: fullName));
    } else if (response.statusCode != 200 && response.statusCode != 500) {
      emit(GetUsernameError(
          stringError: response.data['errors'][0]['msg'].toString()));
    } else {
      emit(GetUsernameError(stringError: "erreur inattendue!"));
    }
  }
}
