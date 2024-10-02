import 'package:bloc/bloc.dart';
import 'package:flutter_farabi_app/core/networking/card_network.dart';
import 'package:meta/meta.dart';

part 'get_points_state.dart';

class GetPointsCubit extends Cubit<GetPointsState> {
   final CardApi cardApi;
  GetPointsCubit(this.cardApi) : super(GetPointsInitial());
  


    Future<void> getPoints() async {
    emit(GetPointsLoading());
    await Future.delayed(const Duration(seconds: 0));

    var response = await cardApi.getJackpot();
  
    print(response.statusCode);
    if (response.statusCode == 200 ) {

      var points = response.data['soldeptsfid'];
      var maxPoints = response.data['max_points'];

    

     
   
      emit(GetPointsLoaded(
           points: points.toDouble(), maxPoints: maxPoints.toDouble()));
    }else if (response.statusCode == 500) {
       emit(GetPointsError(
          errorString:"erreur inattendue"));
    }
    
    
    else {
       emit(GetPointsError(
          errorString:response.data['msg']));
    }
  }

}


