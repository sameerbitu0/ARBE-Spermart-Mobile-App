import 'dart:convert';

import 'package:equatable/equatable.dart';

class AboutUsModel extends Equatable {
  final int id;
  final String description;
  final String description_filipino;
  final String bannerImage;
  final String createdAt;
  final String updatedAt;
  const AboutUsModel({
    required this.id,
    required this.description,
    required this.description_filipino,
    required this.bannerImage,
    required this.createdAt,
    required this.updatedAt,
  });

  AboutUsModel copyWith({
    int? id,
    String? description,
    String? description_filipino,
    String? bannerImage,
    String? createdAt,
    String? updatedAt,
  }) {
    return AboutUsModel(
      id: id ?? this.id,
      description: description ?? this.description,
      description_filipino: description_filipino ?? this.description_filipino,
      bannerImage: bannerImage ?? this.bannerImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'description': description});
    result.addAll({'description_filipino': description_filipino});
    result.addAll({'banner_image': bannerImage});
    result.addAll({'created_at': createdAt});
    result.addAll({'updated_at': updatedAt});

    return result;
  }

  factory AboutUsModel.fromMap(Map<String, dynamic> map) {
    return AboutUsModel(
      id: map['id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      description_filipino: map['description_filipino'] ?? '',
      bannerImage: map['banner_image'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_At'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AboutUsModel.fromJson(String source) =>
      AboutUsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AboutUsModel(id: $id, description: $description,description_filipino: $description_filipino, bannerImage: $bannerImage, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      description,
      description_filipino,
      bannerImage,
      createdAt,
      updatedAt,
    ];
  }
}
