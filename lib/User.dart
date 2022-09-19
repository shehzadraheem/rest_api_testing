class User{
  final String? email;
  final String? first_name;
  final String? last_name;
  User({required this.email, required this.first_name, required this.last_name});

  factory User.fromJson(Map<String,dynamic> map){
    return User(
      email: map['email'],
      first_name: map['first_name'],
      last_name: map['last_name'],
    );
  }
}