class UserModel {
  final String? uid;
  final String? username;
  final String? email;
  final String? name;
  final String? status;
  int? state;
  final String? profileImage;

  UserModel({
    this.email,
    this.name,
    this.profileImage,
    this.state,
    this.status,
    this.uid,
    this.username,
  });

  UserModel userFromJSONtoModel(Map<String, dynamic> user) {
    final UserModel _parsedUser = UserModel(
      name: user['name'],
      username: user['username'],
      email: user['email'],
      uid: user['uid'],
      state: int.parse(user['state']),
      status: user['status'],
      profileImage: user['profileImage'],
    );
    return _parsedUser;
  }

  Map<String, dynamic> userFromModelToJSON(UserModel user) {
    final Map<String, dynamic> _parsedUser = {
      "email": user.email,
      "name": user.name,
      "profileImage": user.profileImage,
      "state": user.state,
      "status": user.status,
      "uid": user.uid,
      "username": user.username,
    };
    return _parsedUser;
  }
}
