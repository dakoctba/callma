import 'package:callma/models/review.dart';
import 'package:callma/repositories/review.repository.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ReviewBloc extends ChangeNotifier {
  var _reviewRepository = ReviewRepository();

  List<Review> _reviews;
  List<Review> get reviews => _reviews;

  final BehaviorSubject<List<Review>> _ReviewBloc =
      BehaviorSubject<List<Review>>();
  Stream<List<Review>> get reviewsStream => _ReviewBloc.stream;

  void getReviews(int professionalId) async {
    _reviews = await _reviewRepository.getReviews(professionalId);
    _ReviewBloc.sink.add(_reviews);
  }

  void dispose() {
    _ReviewBloc.close();

    super.dispose();
  }
}
