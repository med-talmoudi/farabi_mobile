import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/card_network.dart';

part 'get_auth_state.dart';

class GetAuthCubit extends Cubit<GetAuthState> {
  final CardApi cardApi;
  GetAuthCubit(this.cardApi) : super(GetAuthInitial());

  Future<void> getAuth() async {
    emit(GetAuthLoading());

    var response = await cardApi.getAuth();

    if (response.statusCode == 200) {
      emit(GetAuthLoading());
    } else {
      emit(GetAuthLoading());
    }
  }
}
