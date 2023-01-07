import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kolumbo/provider/caja.dart';

import 'package:provider/provider.dart';
import '/routes/route_generator.dart';
import 'provider/authorization.dart';
void main() async{ 
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(    
    statusBarColor: Colors.transparent, // status bar color
  ));
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized()) ;
  MobileAds.instance.initialize();
  
  runApp(const MyApp());
}
// Future initialization (BuildContext context)async{
//   await Future.delayed(Duration(seconds: 3));
// }
class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    // final textTh = Theme.of(context).textTheme;
    return MultiProvider(
        providers: [          
          // ChangeNotifierProvider(create:(_) => LoginValidation()),
          ChangeNotifierProvider(create:(_) => Authorization()),
          ChangeNotifierProvider(create:(context) => Caja()),
        ],
        child: MaterialApp(
          initialRoute: '/home',
          builder: EasyLoading.init(),
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'Kolumbo',
          theme: ThemeData(
             highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
           iconTheme: const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
           primarySwatch: const MaterialColor(0xff7858A6,{
                50:  Color(0xff7858A6),
                100: Color(0xff7858A6),
                200: Color(0xff7858A6),
                300: Color(0xff7858A6),
                400: Color(0xff7858A6),
                500: Color(0xff7858A6),
                600: Color(0xff7858A6),
                700: Color(0xff7858A6),
                800: Color(0xff7858A6),
                900: Color(0xff7858A6),
              }),
            primaryColor: const Color(0xff7858A6),     
                scaffoldBackgroundColor:Colors.transparent,    
            // scaffoldBackgroundColor: const Color(0xff25123a),
            cardColor: const Color(0xff7858A6),            
            // colorScheme: ColorScheme.fromSwatch(  
            //   primarySwatch: const MaterialColor(0xFFFF6B6B,{
            //     50:  Color(0xFFFF6B6B),
            //     100: Color(0xFFFF6B6B),
            //     200: Color(0xFFFF6B6B),
            //     300: Color(0xFFFF6B6B),
            //     400: Color(0xFFFF6B6B),
            //     500: Color(0xFFFF6B6B),
            //     600: Color(0xFFFF6B6B),
            //     700: Color(0xFFFF6B6B),
            //     800: Color(0xFFFF6B6B),
            //     900: Color(0xFFFF6B6B),
            //   }),

            // ),            
            unselectedWidgetColor: Colors.white,
            
            // selectedWidgetColor: Colors.white,
            // disabledColor: Colors.white,
            // accentColor: Colors.white,
            
            // primarySwatch: Colors.blue,
            textTheme: GoogleFonts.acmeTextTheme(
              const TextTheme(
              headline2: TextStyle(color: Colors.black38, fontSize: 14),
              bodyText1: TextStyle(color: Colors.black87, fontSize: 12),
            )
            )
            // textTheme: const TextTheme(
            //   headline2: TextStyle(color: Colors.black87, fontSize: 16,fontFamily: "acme")
            // )
            
          ),
          // darkTheme: ThemeData.dark(),
        )
        );
  }
  
  createMaterialColor(Color color) {

  }
}




