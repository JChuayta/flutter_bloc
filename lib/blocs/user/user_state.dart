class UserState {
  String _username;

  UserState(String name) : this._username = name ?? 'Guest';
  // static UserState _instance = UserState._();
  // factory UserState() => _instance;

  String get username => _username;

  void onChange(value) {
    _username = value;
  }
}
