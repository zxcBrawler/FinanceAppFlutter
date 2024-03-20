class UserModel {
  final String? email;
  final String? password;
  final String? fullName;
  final int? remainingAmount;

  UserModel({
    this.email,
    this.password,
    this.fullName,
    this.remainingAmount,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'full name': fullName,
        'remainingAmount': remainingAmount,
      };
}
