// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Variable _$VariableFromJson(Map<String, dynamic> json) => Variable()
  ..construction_id = json['construction_id'] as num
  ..construct_no = json['construct_no'] as String
  ..construct_type = json['construct_type'] as num
  ..location_name = json['location_name'] as String
  ..longitude = json['longitude'] as num
  ..latitude = json['latitude'] as num
  ..project_name = json['project_name'] as String
  ..construction_unit = json['construction_unit'] as String
  ..construction_manager = json['construction_manager'] as String
  ..manager_phone = json['manager_phone'] as String
  ..vehicle_plate = json['vehicle_plate'] as String
  ..direction = json['direction'] as num
  ..road_section = json['road_section'] as num
  ..road_section_name = json['road_section_name'] as String
  ..lane_list = json['lane_list'] as String
  ..start_stake = json['start_stake'] as String
  ..end_stake = json['end_stake'] as String
  ..start_time = json['start_time'] as String
  ..end_time = json['end_time'] as String
  ..report_time = json['report_time'] as String
  ..worker_number = json['worker_number'] as num
  ..status = json['status'] as num;

Map<String, dynamic> _$VariableToJson(Variable instance) => <String, dynamic>{
      'construction_id': instance.construction_id,
      'construct_no': instance.construct_no,
      'construct_type': instance.construct_type,
      'location_name': instance.location_name,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'project_name': instance.project_name,
      'construction_unit': instance.construction_unit,
      'construction_manager': instance.construction_manager,
      'manager_phone': instance.manager_phone,
      'vehicle_plate': instance.vehicle_plate,
      'direction': instance.direction,
      'road_section': instance.road_section,
      'road_section_name': instance.road_section_name,
      'lane_list': instance.lane_list,
      'start_stake': instance.start_stake,
      'end_stake': instance.end_stake,
      'start_time': instance.start_time,
      'end_time': instance.end_time,
      'report_time': instance.report_time,
      'worker_number': instance.worker_number,
      'status': instance.status,
    };
