import 'package:rxdart/rxdart.dart';

import 'package:callma/models/review.dart';
import 'package:callma/services/reviews_service.dart';

class ReviewsBloc {
  final BehaviorSubject<List<Review>> _controller = BehaviorSubject<List<Review>>();
  Stream<List<Review>> get data => _controller.stream;

  void getReviews(int professionalId) async {
    List<Review> response = await ReviewsService.getReviews(professionalId);
    _controller.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _controller.close();
  }
}
