import 'package:callma/models/summary.dart';
import 'package:rxdart/rxdart.dart';

import 'package:callma/services/summaries_service.dart';

class SummariesController {
  final BehaviorSubject<Summary> _controller = BehaviorSubject<Summary>();
  Stream<Summary> get stream => _controller.stream;

  void getSummary(int professionalId) async {
    Summary response = await SummariesService.getSummary(professionalId);
    _controller.sink.add(response);
  }

  void dispose() {
    _controller.close();
  }
}
