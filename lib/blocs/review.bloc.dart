import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/models/review.dart';
import 'package:callma/repositories/review.repository.dart';
import 'package:rxdart/rxdart.dart';

class ReviewBloc extends BlocBase {
  var _reviewRepository = ReviewRepository();

  List<Review> _reviews;
  List<Review> get reviews => _reviews;

  final BehaviorSubject<List<Review>> _reviewBloc =
      BehaviorSubject<List<Review>>();
  Stream<List<Review>> get reviewsStream => _reviewBloc.stream;

  void getReviews(int professionalId) async {
    _reviews = await _reviewRepository.getReviews(professionalId);
    _reviewBloc.sink.add(_reviews);
  }

  void dispose() {
    _reviewBloc.close();

    super.dispose();
  }
}
