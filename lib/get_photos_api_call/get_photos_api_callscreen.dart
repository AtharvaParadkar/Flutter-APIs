import 'package:flutter/material.dart';
import 'package:flutter_apis/get_photos_api_call/fullscreenphoto.dart';
import 'package:flutter_apis/get_photos_api_call/get_photos_api_controller/get_photos_api_controller.dart';
import 'package:flutter_apis/get_photos_api_call/model/get_photos_api_model.dart';
import 'package:get/get.dart';

class GetPhotosApiCallscreen extends StatelessWidget {
  GetPhotosApiCallscreen({super.key});

  final PhotosController photosController = PhotosController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos Api'),
      ),
      body: GetBuilder<PhotosController>(
        init: photosController,
        builder: (build) {
          return build.photosList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: build.photosList.length,
                  itemBuilder: (ctx, i) {
                    PhotosModel photo = build.photosList[i];
                    return ListTile(
                      title: Text(photo.id.toString()),
                      subtitle: Text(photo.title),
                      leading: SizedBox(
                        height: 90,
                        width: 100,
                        child: Image.network(
                          photo.thumbnailUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FullScreenPhoto(photoUrl: photo.url),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
