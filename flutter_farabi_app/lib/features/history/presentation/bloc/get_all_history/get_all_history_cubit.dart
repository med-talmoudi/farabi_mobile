import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_all_history_state.dart';

class GetAllHistoryCubit extends Cubit<GetAllHistoryState> {
  GetAllHistoryCubit() : super(GetAllHistoryInitial());
}
