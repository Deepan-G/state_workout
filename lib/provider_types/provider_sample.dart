class UserService {
  String userName = "deepan";

  void updateUserName(String name) {
    userName = name;
  }

  Future<List<String>> getProductList() async {

    return await Future<List<String>>.value([
      for (int i = 0; i < 100; i++) 'Product $i',
    ]);
  }
}

///
