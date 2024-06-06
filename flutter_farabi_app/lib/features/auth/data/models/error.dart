class ErrorMsg {
  final String? msg;

  ErrorMsg({required this.msg});
  factory ErrorMsg.fromJson(Map<String, dynamic> json) => ErrorMsg(
    msg: json["msg"]
    );
}
