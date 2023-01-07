import 'package:flutter/cupertino.dart';

class Caja with ChangeNotifier{
   bool _isActiveCaja1=false;
   bool _isActiveCaja2=false;

  List<Color> _listaColores = const [
   Color.fromRGBO(37, 18, 58, 0.6),
   Color.fromRGBO(55, 27, 88,  0.6),
   Color.fromRGBO(76, 53, 117, 0.6),
   Color.fromRGBO(91, 75, 138,  0.6),
   Color.fromRGBO(120, 88, 166,  0.6), 
  ];
  List<Color> _listaColoresActivo=const [
     Color.fromRGBO(37, 18, 58, 1),
    Color.fromRGBO(55, 27, 88, 1),
    Color.fromRGBO(76, 53, 117, 1),
    Color.fromRGBO(91, 75, 138, 1),
    Color.fromRGBO(120, 88, 166, 1), 

    ] ;
  List<Color> _listaColoresCaja1= const [
   Color.fromRGBO(37, 18, 58, 0.6),
   Color.fromRGBO(55, 27, 88,  0.6),
   Color.fromRGBO(76, 53, 117, 0.6),
   Color.fromRGBO(91, 75, 138,  0.6),
   Color.fromRGBO(120, 88, 166,  0.6), 
  ];
  List<Color> _listaColoresCaja2= const [
   Color.fromRGBO(37, 18, 58, 0.6),
   Color.fromRGBO(55, 27, 88,  0.6),
   Color.fromRGBO(76, 53, 117, 0.6),
   Color.fromRGBO(91, 75, 138,  0.6),
   Color.fromRGBO(120, 88, 166,  0.6), 
  ];

  List<Color> get obtenercolores{
    return _listaColores;
  }
  
  set listaColores(List<Color> colores){
    _listaColores=colores;
    notifyListeners();
  }
  List<Color> get listaColoresCaja1 {
    return _listaColoresCaja1;
  }
  bool get caja1{
    return _isActiveCaja1;
  }
  set caja1(bool isActive){
    _isActiveCaja1= isActive;
    _isActiveCaja1?_listaColoresCaja1=_listaColoresActivo:_listaColoresCaja1=_listaColores;
    notifyListeners();
  }

  List<Color> get listaColoresCaja2 {
    return _listaColoresCaja2;
  }
  bool get caja2{
    return _isActiveCaja2;
  }
  set caja2(bool isActive){
    _isActiveCaja2= isActive;
    _isActiveCaja2?_listaColoresCaja2=_listaColoresActivo:_listaColoresCaja2=_listaColores;
    notifyListeners();
  }

}  