import 'package:callma/models/summary.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:callma/repositories/summary.repository.dart';

class SummaryBloc extends ChangeNotifier {
  var _summaryRepository = SummaryRepository();

  final BehaviorSubject<Summary> _controller = BehaviorSubject<Summary>();
  Stream<Summary> get stream => _controller.stream;

  void getSummary(int professionalId) async {
    Summary response = await _summaryRepository.getSummary(professionalId);
    _controller.sink.add(response);
  }

  void dispose() {
    _controller.close();

    super.dispose();
  }
}
