base class ApiWrapper<T> {
  const ApiWrapper(
      {required this.data, required this.message, required this.isSuccess});

  final T? data;
  final String message;
  final bool isSuccess;

  ApiWrapper.error({
    this.message = 'Bir hata oluştu',
    this.isSuccess = false,
  }) : data = null;
}
