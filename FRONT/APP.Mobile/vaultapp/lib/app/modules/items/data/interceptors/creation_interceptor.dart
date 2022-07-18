class ItemCreationInterceptor {
  int requestNumber = 0;

  int get() {
    return requestNumber;
  }

  increment() {
    requestNumber++;
  }

  static final ItemCreationInterceptor _creationInterceptor =
      ItemCreationInterceptor._internal();

  factory ItemCreationInterceptor() {
    return _creationInterceptor;
  }

  ItemCreationInterceptor._internal();
}
