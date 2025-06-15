// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserDetailsModel {
  final int id;
  final int count;
  final String profilePic;
  final String secondProfilePic;
  final String resume;

  UserDetailsModel(
      {required this.id,
      required this.count,
      required this.profilePic,
      required this.secondProfilePic,
      required this.resume});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'count': count,
      'profilePic': profilePic,
      'secondProfilePic': secondProfilePic,
      'resume': resume
    };
  }

  factory UserDetailsModel.fromMap(Map<String, dynamic> map) {
    return UserDetailsModel(
      id: map['id'] as int,
      count: map['count'] as int,
      profilePic: map['profilePic'] as String,
      secondProfilePic: map['secondProfilePic'] as String,
      resume: map['resume'] as String,
    );
  }
  static UserDetailsModel isEmpty() {
    return UserDetailsModel(
        id: 0, count: 10, profilePic: "", secondProfilePic: "", resume: "");
  }
}
