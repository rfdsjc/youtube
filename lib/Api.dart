import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const URL_BASE = "https://www.googleapis.com/youtube/v3/";
const CHAVE_YOUTUBE_API = "AIzaSyC_pWjGMvk7-1lFHpYaXDxMJWRIKauOTe8";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelID=$ID_CANAL"
            "&q=$pesquisa"));
    if (response.statusCode == 200) {
      Map<String?, dynamic?> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fronJson(map);
        //return Video.converterJson(map);
      }).toList();

      return videos;

      /* for (var video in videos){
        print("ID: "+ video.id.toString());
        print("Canal: "+ video.canal.toString());
        print("Titulo: "+ video.titulo.toString());
        print("Imagem: "+ video.imagem.toString());
      }*/

      /* for (var video in dadosJson["items"]){
        print("Resultado: " + video.toString());
      }*/

      //print("Resultado: " + dadosJson["items"][0]["snippet"]["title"]);
    }
  }
}
