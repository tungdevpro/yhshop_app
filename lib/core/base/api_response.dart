class ApiResponse<T> {
  final int code;
  final String? msg;
  final T? data;

  ApiResponse({this.code = 0, this.msg, this.data});
}