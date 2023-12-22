/// Project network url paths
enum ProductServicePath {
  users('/users');

  /// Base url query
  final String value;

  /// Query construct
  const ProductServicePath(this.value);

  ///[withQuery] is add query to path
  ///
  ///Example: exp/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }
}
