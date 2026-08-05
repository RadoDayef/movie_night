abstract class ApiResult<T> {}

class ApiResultSuccess<T> extends ApiResult<T> {
  T data;

  ApiResultSuccess(this.data);
}

class ApiResultFailure<T> extends ApiResult<T> {
  String message;

  ApiResultFailure(this.message);
}
