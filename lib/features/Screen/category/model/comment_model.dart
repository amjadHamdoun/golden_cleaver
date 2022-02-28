import 'package:golden_cleaver/features/Screen/MyAccount/model/data.dart';
import 'package:json_annotation/json_annotation.dart';


part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {

 final DateTime created_at;
  final String? content;
  final UserData? user;



  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);

  CommentModel(
      {
        required  this.content,
        required  this.user,
        required this.created_at
      });
}
