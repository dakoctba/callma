import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:callma/models/address.dart';
import 'package:callma/repositories/user.repository.dart';
import 'package:rxdart/rxdart.dart';

class AddressBloc extends BlocBase {
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
