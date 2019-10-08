class UsersHelper {
  bool isEmailValid(String email) {
    bool result = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return result;
  }
}
