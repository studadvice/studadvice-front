import 'package:get/get.dart';
import '../../../stud_advice.dart';

class DealDetailController extends GetxController {
  var _firebaseFirestoreInstance = AppDependenciesBinding.firebaseFirestoreInstance;

  var userRatings = <String, double>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initUserRatings();
  }

  Future<void> initUserRatings() async {
    try {
      var userRatingsCollection = await _firebaseFirestoreInstance.collection("user_ratings").get();

      for (var ratingDoc in userRatingsCollection.docs) {
        var dealId = ratingDoc.id;
        userRatings[dealId] = ratingDoc["rating"];
      }
    } catch (e) {
      print("Error initializing user ratings: $e");
    }
  }


  Future<void> setUserRating(String dealId, double rating) async {
    bool hasAlreadyRated = await isRated(dealId);
    if (!hasAlreadyRated) {
      saveRating(dealId, rating);
      userRatings[dealId] = rating;
    }
  }

  Future<bool> isRated(String dealId) async {
    try {
      var doc = await _firebaseFirestoreInstance
          .collection("user_ratings")
          .doc(dealId)
          .get();

      return doc.exists;
    } catch (e) {
      print("Error checking if deal is rated: $e");
      return false;
    }
  }

  void saveRating(String dealId, double rating) {
    _firebaseFirestoreInstance.collection("user_ratings").doc(dealId).set({
      "dealId": dealId,
      "rating": rating,
    });
  }
}
