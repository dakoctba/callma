import 'package:callma/models/summary.dart';
import 'package:rxdart/rxdart.dart';

import 'package:callma/services/summaries_service.dart';

class SummaryBloc {
  final BehaviorSubject<Summary> _controller = BehaviorSubject<Summary>();
  Stream<Summary> get data => _controller.stream;

  void getSummary(int professionalId) async {
    Summary response = await SummariesService.getSummaries(professionalId);
    _controller.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _controller.close();
  }
}

final bloc = SummaryBloc();
