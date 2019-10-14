import 'package:callma/models/address.dart';
import 'package:callma/repositories/user.repository.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/subjects.dart';

class AddressBloc extends ChangeNotifier {
  var _userRepository = UserRepository();
  List<Address> _addresses;

  var _controller = BehaviorSubject<List<Address>>();
  Stream<List<Address>> get addressesStream => _controller.stream;

  void getAddresses(int userId) async {
    _addresses = await _userRepository.getAddresses(userId);
    _controller.sink.add(_addresses);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
}
