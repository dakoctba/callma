import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:callma/models/specialty.dart';
import 'package:callma/repositories/specialty.repository.dart';

class SpecialtyBloc extends ChangeNotifier {
  var _specialtyRepository = SpecialtyRepository();

  List<Specialty> _specialties;
  List<Specialty> get specialties => _specialties;

  final BehaviorSubject<List<Specialty>> _controller =
      BehaviorSubject<List<Specialty>>();
  Stream<List<Specialty>> get stream => _controller.stream;

  void getSpecialties(int professionId) async {
    List<Specialty> response =
        await _specialtyRepository.getSpecialties(professionId);
    _controller.sink.add(response);
  }

  void dispose() {
    _controller.close();

    super.dispose();
  }
}
