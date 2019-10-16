import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/models/summary.dart';
import 'package:callma/repositories/summary.repository.dart';
import 'package:rxdart/rxdart.dart';

class SummaryBloc extends BlocBase {
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
