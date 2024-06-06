class RegistrationResponse {
  final String status;

  RegistrationResponse({required this.status});

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      status: json['status'],
    );
  }
}
