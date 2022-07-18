class ItemCreationInterceptor {
  int requestNumber = 1;

  static final ItemCreationInterceptor _creationInterceptor =
      ItemCreationInterceptor._internal();

  factory ItemCreationInterceptor() {
    return _creationInterceptor;
  }

  ItemCreationInterceptor._internal();
}
