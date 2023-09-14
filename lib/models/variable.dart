import 'package:json_annotation/json_annotation.dart';

part 'variable.g.dart';

@JsonSerializable()
class Variable {
  Variable();

  late num construction_id;
  late String construct_no;
  late num construct_type;
  late String location_name;
  late num longitude;
  late num latitude;
  late String project_name;
  late String construction_unit;
  late String construction_manager;
  late String manager_phone;
  late String vehicle_plate;
  late num direction;
  late num road_section;
  late String road_section_name;
  late String lane_list;
  late String start_stake;
  late String end_stake;
  late String start_time;
  late String end_time;
  late String report_time;
  late num worker_number;
  late num status;

  factory Variable.fromJson(Map<String, dynamic> json) =>
      _$VariableFromJson(json);
  Map<String, dynamic> toJson() => _$VariableToJson(this);
}
