import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/image_modal.dart';

class ImageRepository {
  Future<List<PixelFordImage>> getNetworkImages() async {
    var endpointUrl = Uri.parse('https://pixelford.com/api2/images');
    final response = await http.get(endpointUrl);

    if (response.statusCode == 200) {
      final List<dynamic> decodedList = jsonDecode(response.body) as List;
      final List<PixelFordImage> imageList = decodedList.map((listItem) {
        return PixelFordImage.fromJson(listItem);
      }).toList();

      print(imageList[0].urlFullSize);
      return imageList;
    } else {
      throw Exception('Failed');
    }
  }
}
