
import 'package:ageapp/Contenidos/Letra y Acordes/Canciones/MusicaClass.dart';

class letras{
  MusicaClass musicaData = MusicaClass();
  String nombreCan (int i){
    return musicaData.getnombre(i);
  }

  String letrasand(int tono,int ind, int i){
    tono+= 10;
    String can;
    if(ind==1){
      can = musicaData.getletras(i);
    } else if(ind==2){
      can=  musicaData.getacordes(i, tono);
    }
  return can;
  }
}








