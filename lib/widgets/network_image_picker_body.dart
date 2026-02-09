import 'package:flutter/material.dart';
import 'package:learn_flutter/repository/image_repository.dart';

import '../models/image_modal.dart';

class NetworkImagePickerBody extends StatelessWidget {
  NetworkImagePickerBody({super.key});

  final ImageRepository imageRepository = ImageRepository();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PixelFordImage>>(
      future: imageRepository.getNetworkImages(),
      builder:
          (BuildContext context, AsyncSnapshot<List<PixelFordImage>> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Image.network(snapshot.data![index].urlSmallSize);
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2,
                  mainAxisExtent: MediaQuery.of(context).size.width * 0.5,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          },
    );
  }
}
