import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
class Cajas {
  String nombre;
  String ruta1;
  String? ruta2;
  int milisegundos;
  bool esDosRutas;
  bool actividad;
  Widget icono;
  double volumen;
  AudioPlayer audioplayer1;
  AudioPlayer audioplayer2;
  Cajas({required this.nombre,required this.ruta1,this.ruta2,required this.milisegundos,required this.esDosRutas,required this.actividad, required this.icono,required this.volumen,required this.audioplayer1,required this.audioplayer2});
}