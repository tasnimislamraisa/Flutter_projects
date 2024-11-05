class Urls{
  static const String  _baseUrl="http://152.42.163.176:2008/api/v1";
  static const String createProductUrl="$_baseUrl/CreateProduct";
  static String updateProductByIdUrl(int id)=>"$_baseUrl/UpdateProduct/$id";
  static const String readProductUrl="$_baseUrl/ReadProduct";
  static  String readProductByIdUrl(int id)=>"$_baseUrl/ReadProductById/$id";
  static  String deleteProductbyIdUrl(int id)=>"$_baseUrl/DeleteProduct/$id";
}