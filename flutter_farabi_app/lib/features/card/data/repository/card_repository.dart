



import '../../../../core/networking/card_network.dart';


class CardRepository {
  final CardApi cardApi;

  CardRepository(this.cardApi);

  Future<dynamic> createECard() async {
    try {
      var response = await cardApi.createECard();

    
      return response;
    }catch (_) {
      return "erreur inattendue";
    }
  }



  Future<dynamic> getUser() async {
    try {
      var response = await cardApi.getUser();

    
      return response;
    }catch (_) {
      return "erreur inattendue";
    }
  }
   Future<dynamic> addCard(String cardNumber) async {
    try {
      var response = await cardApi.addCard(cardNumber);
    
      return response;
    }catch (_) {
      return "erreur inattendue";
    }
  }
}
