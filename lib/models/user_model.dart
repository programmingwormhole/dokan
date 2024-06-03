class UserModel {
  String? id;
  String? fName;
  String? lName;
  String? username;
  String? email;
  String? password;
  String? cPassword;
  String? profilePicture;

  UserModel({
    this.id,
    this.fName,
    this.lName,
    this.username,
    this.email,
    this.password,
    this.cPassword,
    this.profilePicture,
  });

  Map<String, String> toMap() => {
        'username': username ?? '',
        'email': email ?? '',
        'password': password ?? '',
      };


  Map<String, String> toUpdate () => {
    'first_name': fName ?? '',
    'last_name': lName ?? '',
  };

  String name() => '${fName ?? ''} ${lName ?? ''}';
}
