import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/networking/card_network.dart';

part 'get_all_history_state.dart';

class GetAllHistoryCubit extends Cubit<GetAllHistoryState> {
  final CardApi cardApi;
  GetAllHistoryCubit(this.cardApi) : super(GetAllHistoryInitial());
   Future<void> getAllHistory() async {
      print("******************************************************1");
    emit(GetAllHistoryLoading());
    print("******************************************************2");
    var response = await cardApi.getAllHistory();
    print("******************************************************3");
    if (response.statusCode == 200) {
      emit(GetAllHistoryLoaded(response.data));
      print(response.data);
      print("******************************************************4");
    } else {
      emit(GetAllHistoryError(errorString: "not found"));
      print("******************************************************5");
    }
  }
}
