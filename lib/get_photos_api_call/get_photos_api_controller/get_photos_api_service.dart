import 'dart:convert';

import 'package:flutter_apis/get_photos_api_call/model/get_photos_api_model.dart';
import 'package:http/http.dart' as https;

class PhotosService{
  static const String _photoUrl='https://fakestoreapiserver.reactbd.com/photos';

  Future<List<PhotosModel>> fetchPhotosService() async{
    try{
      final responses = await https.get(Uri.parse(_photoUrl));

      if(responses.statusCode==200){
        List<dynamic> photos = jsonDecode(responses.body);
        return photos.map((pho)=>PhotosModel.fromJson(pho)).toList();
      }else{
        throw Exception('Failed to show Photos');
      }
    }catch(c){
      throw Exception('Failed $c');
    }
  }
}