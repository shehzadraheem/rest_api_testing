class User{
  final String? email;
  final String? first_name;
  final String? last_name;
  User({required this.email, required this.first_name, required this.last_name});

  factory User.fromJson(Map<String,dynamic> map){
    return User(
      email: map['data']['email'],
      first_name: map['data']['first_name'],
      last_name: map['data']['last_name'],
    );
  }

  Map<String,dynamic> toJson() => {
    'email' : email,
    'first_name' : first_name,
    'last_name' : last_name,
  };
}