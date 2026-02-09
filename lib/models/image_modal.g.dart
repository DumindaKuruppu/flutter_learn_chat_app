// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelFormImage _$PixelFormImageFromJson(Map<String, dynamic> json) =>
    PixelFormImage(
      id: json['id'] as String,
      fileName: json['fileName'] as String,
      title: json['title'] as String,
      urlFullSize: json['url_full_size'] as String,
      urlSmallSize: json['url_small_size'] as String,
    );

Map<String, dynamic> _$PixelFormImageToJson(PixelFormImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fileName': instance.fileName,
      'title': instance.title,
      'url_full_size': instance.urlFullSize,
      'url_small_size': instance.urlSmallSize,
    };
