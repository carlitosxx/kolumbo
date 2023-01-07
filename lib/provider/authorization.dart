import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
class Authorization with ChangeNotifier{
  final _storage = const FlutterSecureStorage();
   bool _isAuth=false; 
  String _direction='';
  //getter 
  bool get isAuth => _isAuth;  
  //setter 
  set isAuth(bool value){
    _isAuth = value;
    notifyListeners();
  }

  Future getDirectionChanged() async{
      final direction= await _storage.read(key:'cliente_dire')??'';
      changeDirection=direction;
      return direction;     
  }
   String get direction{
    return _direction;
  }
  set changeDirection(String dire){
    _direction=dire;
    notifyListeners();
  }

  // METODOS GET
  Future<String> getIden() async{
      final iden= await _storage.read(key:'cliente_iden')??'';
      return iden;
  }
  Future<String> getPhone() async{      
      final  celu = await _storage.read(key:'cliente_celu')??'';
      return celu;
  }
  Future<String> getName() async{      
      final  name = await _storage.read(key:'cliente_nomb')??'';
      return name;
  }
  Future<String> getSurname() async{      
      final  surname = await _storage.read(key:'cliente_apel')??'';
      return surname;
  }
  Future <String> getDirection() async{
      final direction= await _storage.read(key:'cliente_dire')??'';
      return direction;
  }
  Future <String> getRefDirection() async{
      final refDirection= await _storage.read(key:'cliente_redi')??'';
      return refDirection;
  }
  Future<String> getLati() async{      
      final  lati = await _storage.read(key:'cliente_lati')??'';
      return lati;
  }
  Future<String> getLong() async{      
      final  long = await _storage.read(key:'cliente_long')??'';
      return long;
  }
  Future<String> getToken() async{      
      final  token = await _storage.read(key:'token')??'';
      return token;
  }
  Future<String> getOrderId()async{
    final orderId = await _storage.read(key:'order_id')??'';
    return orderId;
  }
  
  

  // METODOS SAVE
  Future saveIden(String iden) async{
    return await _storage.write(key:'cliente_iden', value: iden);
  }
  Future savePhone(String clienteCelu) async{
    return await _storage.write(key: 'cliente_celu', value: clienteCelu);
  }
  Future saveName(String clienteNomb) async{
    return await _storage.write(key: 'cliente_nomb', value: clienteNomb);
  }
  Future saveSurname(String clienteApel) async{
    return await _storage.write(key: 'cliente_apel', value: clienteApel);
  }
  Future saveDirection(String direction) async{
    return await _storage.write(key: 'cliente_dire', value: direction);
  }
  Future saveRefDirection(String refDirection) async{
    return await _storage.write(key: 'cliente_redi', value: refDirection);
  }
  Future saveLati(String lati) async{
    return await _storage.write(key:'cliente_lati',value:lati);
  }
  Future saveLong(String long) async{
    return await _storage.write(key:'cliente_long',value:long);
  }
  Future saveToken(String token) async{
    return await _storage.write(key: 'token', value: token);
  }
  Future saveOrderId (String orderID) async{
    return await _storage.write(key: 'order_id',value:orderID);
  }
  
  //METODOS DELETE
  Future deleteToken() async{
    await _storage.delete(key: 'token');
  }
  Future<void> logout() async{      
      await _storage.deleteAll();      
  }
}