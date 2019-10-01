import 'package:rxdart/rxdart.dart';

import 'package:callma/models/review.dart';
import 'package:callma/repositories/reviews_repository.dart';

class ReviewsBloc {
  final BehaviorSubject<List<Review>> _subject = BehaviorSubject<List<Review>>();
  BehaviorSubject<List<Review>> get subject => _subject;

  void getReviews(int professionalId) async {
    List<Review> response = await ReviewsRepository.getReviews(professionalId);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
}

final bloc = ReviewsBloc();
