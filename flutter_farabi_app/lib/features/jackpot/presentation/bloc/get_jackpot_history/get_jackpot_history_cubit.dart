import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/card_network.dart';

part 'get_jackpot_history_state.dart';

class GetJackpotHistoryCubit extends Cubit<GetJackpotHistoryState> {
  final CardApi cardApi;
  GetJackpotHistoryCubit(this.cardApi) : super(GetJackpotHistoryInitial());

  
    Future<void> getJackpotHistory() async {
      print("******************************************************1");
    emit(GetJackpotHistoryLoading());
    print("******************************************************2");
    var response = await cardApi.getJackpotHistory();
    print("******************************************************3");
    if (response.statusCode == 200) {
      emit(GetJackpotHistoryLoaded(response.data));
      print(response.data);
      print("******************************************************4");
    } else {
      emit(GetJackpotHistoryError(errorString: "not found"));
      print("******************************************************5");
    }
  }
}
