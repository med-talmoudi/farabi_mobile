import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/card_network.dart';

part 'get_card_history_state.dart';

class GetCardHistoryCubit extends Cubit<GetCardHistoryState> {
    final CardApi cardApi;
  GetCardHistoryCubit(this.cardApi) : super(GetCardHistoryInitial());

    Future<void> getCardHistory() async {
      print("******************************************************1");
    emit(GetCardHistoryLoading());
    print("******************************************************2");
    var response = await cardApi.getCardHistory();
    print("******************************************************3");
    if (response.statusCode == 200) {
      emit(GetCardHistoryLoaded(response.data));
      print(response.data);
      print("******************************************************4");
    } else {
      emit(GetCardHistoryError(errorString: "not found"));
      print("******************************************************5");
    }
  }
}


