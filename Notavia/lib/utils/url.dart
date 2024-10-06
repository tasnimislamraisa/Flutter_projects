class Urls{
  static const String  _baseUrl="http://152.42.163.176:2008/api/v1";
  static const String _createProductUrl="$_baseUrl/CreateProduct";
  static String _updateProductByIdUrl(int id)=>"$_baseUrl/UpdateProduct/$id";
  static const String _readProductUrl="$_baseUrl/ReadProduct";
  static  String _readProductByIdUrl(int id)=>"$_baseUrl/ReadProductById/$id";
  static  String _deleteProductbyIdUrl(int id)=>"$_baseUrl/DeleteProduct/$id";


}