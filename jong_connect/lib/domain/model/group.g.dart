// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupImpl _$$GroupImplFromJson(Map<String, dynamic> json) => _$GroupImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      seasons: (json['seasons'] as List<dynamic>?)
          ?.map((e) => Season.fromJson(e as Map<String, dynamic>))
          .toList(),
      joinedUsers: (json['user_joinned_groups'] as List<dynamic>?)
              ?.map((e) => UserJoinedGroup.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GroupImplToJson(_$GroupImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'seasons': instance.seasons?.map((e) => e.toJson()).toList(),
      'user_joinned_groups':
          instance.joinedUsers.map((e) => e.toJson()).toList(),
    };
