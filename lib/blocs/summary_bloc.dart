import 'package:callma/models/summary.dart';
import 'package:rxdart/rxdart.dart';

import 'package:callma/repositories/summaries_repository.dart';

class SummaryBloc {
  final BehaviorSubject<Summary> _subject = BehaviorSubject<Summary>();
  BehaviorSubject<Summary> get subject => _subject;

  void getSummary(int professionalId) async {
    Summary response = await SummariesRepository.getSummaries(professionalId);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
}

final bloc = SummaryBloc();
