import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio/just_audio.dart';
// import 'package:pay/pay.dart';
// import 'package:in_app_review/in_app_review.dart';
// DATA: listacajas
import 'data/cajas.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {    
  PageController pageController = PageController();
  final BannerAd myBanner = BannerAd(
      adUnitId: 'ca-app-pub-7198530631491664/8477865367',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );  

  @override
  void initState() {
    super.initState();
    myBanner.load();    
    for (var element in listaCajas) {
      if (element.esDosRutas){
        element.audioplayer1.setLoopMode(LoopMode.all);
        element.audioplayer1.setUrl("asset:///assets/audio/${element.ruta1}.mp3");
        element.audioplayer2.setLoopMode(LoopMode.all);
        element.audioplayer2.setUrl("asset:///assets/audio/${element.ruta2}.mp3");
      }else{
        element.audioplayer1.setLoopMode(LoopMode.all);
        element.audioplayer1.setUrl("asset:///assets/audio/${element.ruta1}.mp3");        
      }      
    }
    Future.delayed(Duration(seconds: 3)).then((value) => {
        FlutterNativeSplash.remove()  
    });     
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: myBanner);
    return WillPopScope(
      onWillPop:  ()async=>false,
      child: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
          image: AssetImage('assets/background/1.jpeg'),
          fit: BoxFit.cover  
          ),
          ),        
        child: SafeArea(
          child: Scaffold(
            body: CustomScrollView(
                slivers: [ 
                  // SliverToBoxAdapter(
                  //   child: 
                  //   Container(
                  //     height: 100,
                  //     width: 100,
                  //     // decoration: BoxDecoration(
                  //     //   image: DecorationImage(
                  //     //     image: AssetImage("assets/icon/icon.png"),
                  //     //     fit: BoxFit.cover,
                  //     //   ),
                  //     // ),
                  //     child: Image.asset('assets/background/1.jpeg'),
                  //   )
                  // ),   
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.transparent,
                      width: myBanner.size.width.toDouble(),
                      height: myBanner.size.height.toDouble(),
                      child: adWidget,
                    )
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.transparent,
                      width: myBanner.size.width.toDouble(),
                      height: myBanner.size.height.toDouble(),
                      child: const Center(child: Text('RECOMENDAMOS USAR AUDIFONOS',style: TextStyle(color: Colors.white),)),
                    )
                  ),        
                  SliverPadding(
                    padding: const EdgeInsets.all(10.0),
                    sliver: SliverGrid(              
                      gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(  
                        crossAxisCount: 3,          
                        crossAxisSpacing: 10,
                        mainAxisSpacing:10,          
                        ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext ctx, index){
                          return Stack(
                            children:[                   
                              Center(
                                child: Container(                    
                                    height: 200,
                                    width: 200,                  
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient:  LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end:Alignment.topCenter,
                                                  colors: listaCajas[index].actividad==true?const [
                                                    Color(0xff371B58),
                                                    Color(0xff4C3575),
                                                    Color(0xff5B4B8A),
                                                    Color(0xff7858A6),   
                                                  ]:const [
                                                      Color.fromRGBO(37, 18, 58, 0.6),
                                                      Color.fromRGBO(55, 27, 88,  0.6),
                                                      Color.fromRGBO(76, 53, 117, 0.6),
                                                      Color.fromRGBO(91, 75, 138,  0.6),
                                                      Color.fromRGBO(120, 88, 166,  0.6),   
                                                  ],
                                                ),
                                    ),
                                    child: StreamBuilder<PlayerState>(
                                      stream: listaCajas[index].audioplayer1.playerStateStream,
                                      builder: (context, snapshot) {
                                        final playerState = snapshot.data;
                                        if(playerState!=null){
                                          final processingState = playerState.processingState;
                                          if (processingState == ProcessingState.loading ||
                                            processingState == ProcessingState.buffering) {
                                              return Container(
                                                margin: const EdgeInsets.all(8.0),
                                                width: 64.0,
                                                height: 64.0,
                                                child: const CircularProgressIndicator(),
                                            );                        
                                          }
                                          else if (listaCajas[index].audioplayer1.playing != true) {    
                                            return IconButton( 
                                              splashColor: Colors.transparent,  
                                              highlightColor: Colors.transparent,       
                                              icon: listaCajas[index].icono,iconSize: 80,
                                              onPressed: () async {
                                              if (listaCajas[index].esDosRutas==true) {            
                                                listaCajas[index].actividad=!listaCajas[index].actividad;
                                                setState(() {                      
                                                });                                  
                                                listaCajas[index].audioplayer1.play();
                                                await Future.delayed(Duration(milliseconds:listaCajas[index].milisegundos));                                  
                                                listaCajas[index].audioplayer2.play();                       
                                              }else{
                                                listaCajas[index].actividad=!listaCajas[index].actividad;
                                                setState(() {                      
                                                });
                                                listaCajas[index].audioplayer1.play();
                                              }     
                                              }
                                            );
                                          }else {   
                                            return                              
                                              IconButton(
                                                splashColor: Colors.transparent,  
                                                highlightColor: Colors.transparent,                                  
                                                icon:  listaCajas[index].icono,
                                                iconSize: 80.0,
                                                onPressed: (){
                                                  listaCajas[index].actividad=!listaCajas[index].actividad;
                                                  listaCajas[index].audioplayer1.stop();
                                                  listaCajas[index].audioplayer2.stop();
                                                  setState(() {                      
                                                });
                                                }
                                              
                                              // ),
                                            );
                                          }
                                        }
                                        return Container();
                                      },
                                    )
                                ),
                              ),
                              Positioned.fill(                    
                                top: 5,                   
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(listaCajas[index].nombre,style: const TextStyle(color: Colors.white,fontSize: 10),))),
                              Visibility(
                                visible: listaCajas[index].actividad,
                                child: Positioned(                                  
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: SizedBox(                            
                                      width: 110,
                                      height: 25,
                                      child: Slider(                                        
                                        value: listaCajas[index].volumen,
                                        min:0,
                                        max:1, 
                                        divisions: 100,   
                                        label: listaCajas[index].volumen.toString(),                         
                                        onChanged: (double valor){
                                          setState(() {
                                            listaCajas[index].volumen=valor;
                                            listaCajas[index].audioplayer1.setVolume(listaCajas[index].volumen);
                                            listaCajas[index].audioplayer2.setVolume(listaCajas[index].volumen);
                                          });                                    
                                        },
                                        ),   
                                      ),
                                  ),
                                  )
                              )                          
                            ]
                          );
                        },
                      childCount: listaCajas.length,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.transparent,
                      width: myBanner.size.width.toDouble(),
                      height: myBanner.size.height.toDouble(),
                      child: const Center(child: Text('RETROALIMENTACION AL WS: +51 917946993',style: TextStyle(color: Colors.white),)),
                    )
                  ),    
                ],
              ),         
          ),
        ),
      ),
    );    
  }
}