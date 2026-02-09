import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/image_modal.dart';

class ImageRepository {
  Future<List<PixelFordImage>> getNetworkImages() async {
    try {
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
    } on SocketException {
      throw Exception("no internet");
    } on HttpException {
      throw Exception("Cannot get Data");
    } on FormatException {
      throw Exception("Wrong Data");
    } catch (e) {
      throw Exception("unknown error");
    }
  }
}
