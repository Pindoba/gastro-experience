// import 'package:json_annotation/json_annotation.dart';

// part 'services.g.dart';

// @JsonSerializable()
class Services {
  int idService;
  String label;
  String description;

  Services({
    required this.idService,
    required this.label,
    required this.description,
  });

  // factory Services.fromJson(Map<String, dynamic> json) =>
  //     _$ServicesFromJson(json);

  // Map<String, dynamic> toJson() => _$ServicesToJson(this);
}