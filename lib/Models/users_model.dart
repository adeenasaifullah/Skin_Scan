class AuthenticateUser{
  final String userID;

  AuthenticateUser({
    required this.userID
});
}


class UserProfile {
  String uid;
  String name;


  UserProfile({
    required this.uid,
    required this.name,

  });

  static fromJson(Map<String, dynamic> json) {
    return UserProfile(

      uid: json['uid'],
      name: json['name'],
    );
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['uid'] = this.uid;
    data['name'] = this.name;


    return data;
  }
}