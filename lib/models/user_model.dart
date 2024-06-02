class UserModel {
  String? username;
  String? email;
  String? password;
  String? cPassword;
  String? profilePicture;

  UserModel({
    this.username,
    this.email,
    this.password,
    this.cPassword,
    this.profilePicture,
  });

  Map<String, String> toMap () => {
    'username' : username ?? '',
    'email' : email ?? '',
    'password' : password ?? '',
  };
}
