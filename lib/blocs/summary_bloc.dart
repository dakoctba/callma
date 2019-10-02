import 'package:callma/models/summary.dart';
import 'package:rxdart/rxdart.dart';

import 'package:callma/services/summaries_service.dart';

class SummaryBloc {
  final BehaviorSubject<Summary> _subject = BehaviorSubject<Summary>();
  BehaviorSubject<Summary> get subject => _subject;

  void getSummary(int professionalId) async {
    Summary response = await SummariesService.getSummaries(professionalId);
    _subject.sink.add(response);
  }

  dispose() {
    print("Chamou o dispose em ${this.runtimeType}");
    _subject.close();
  }
}

final bloc = SummaryBloc();
