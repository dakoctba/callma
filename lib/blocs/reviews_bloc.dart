import 'package:rxdart/rxdart.dart';

import 'package:callma/models/review.dart';
import 'package:callma/services/reviews_service.dart';

class ReviewsBloc {
  final BehaviorSubject<List<Review>> _subject = BehaviorSubject<List<Review>>();
  BehaviorSubject<List<Review>> get subject => _subject;

  void getReviews(int professionalId) async {
    List<Review> response = await ReviewsService.getReviews(professionalId);
    _subject.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _subject.close();
  }
}

final bloc = ReviewsBloc();
