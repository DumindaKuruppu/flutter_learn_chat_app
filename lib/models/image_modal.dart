import 'package:json_annotation/json_annotation.dart';
part 'image_modal.g.dart';

@JsonSerializable()
class PixelFormImage {
  String id;
  String fileName;
  String title;
  String urlFullSize;
  String urlSmallSize;

  PixelFormImage({
    required this.id,
    required this.fileName,
    required this.title,

    @JsonKey(name: 'url_full_size') required this.urlFullSize,
    @JsonKey(name: 'url_small_size') required this.urlSmallSize,
  });

  factory PixelFormImage.fromJson(Map<String, dynamic> json) =>
      _$PixelFormImageFromJson(json);

  /// Connect the generated [_$PixelFormImageToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PixelFormImageToJson(this);
}
