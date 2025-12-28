import 'package:json_annotation/json_annotation.dart';

part 'seat.g.dart';

@JsonSerializable()
class Seat {
  final String id;
  final String label;
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  final String type; // e.g., 'standard', 'premium'
  final double price;
  final int? row;
  final int? col;

  Seat({
    required this.id,
    required this.label,
    required this.isAvailable,
    required this.type,
    required this.price,
    this.row,
    this.col,
  });

  factory Seat.fromJson(Map<String, dynamic> json) => _$SeatFromJson(json);
  Map<String, dynamic> toJson() => _$SeatToJson(this);
}
