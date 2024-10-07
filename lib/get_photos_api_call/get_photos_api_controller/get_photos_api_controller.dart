import 'package:flutter_apis/get_photos_api_call/model/get_photos_api_model.dart';
import 'package:flutter_apis/get_photos_api_call/get_photos_api_controller/get_photos_api_service.dart';
import 'package:get/get.dart';

class PhotosController extends GetxController{
  List<PhotosModel> photosList=[];

  final PhotosService _photosService=PhotosService();

  @override
  void onInit(){
    fetchPhotos();
    super.onInit();
  }

  fetchPhotos() async{
    try {
      photosList = await _photosService.fetchPhotosService();
      update();
    }catch(p){
      print('Error $p');
    }
  }
}