import 'package:rxdart/rxdart.dart';

import 'package:callma/models/review.dart';
import 'package:callma/services/reviews_service.dart';

class ReviewsController {
  List<Review> _reviews;
  List<Review> get reviews => _reviews;

  final BehaviorSubject<List<Review>> _reviewsController = BehaviorSubject<List<Review>>();
  Stream<List<Review>> get reviewsStream => _reviewsController.stream;

  void getReviews(int professionalId) async {
    _reviews = await ReviewsService.getReviews(professionalId);
    _reviewsController.sink.add(_reviews);
  }

  void dispose() {
    _reviewsController.close();
  }
}
