//상태관리를 위한 추상클래스
import 'package:json_annotation/json_annotation.dart';

part 'list_model.g.dart';

abstract class ListModelBase {}

//ListModel Error
class ListModelError extends ListModelBase {
  final String message;

  ListModelError({
    required this.message,
  });
}

//ListModel Loading 상태
class ListModelLoading extends ListModelBase {}

//리스트 모델 Wrapper
@JsonSerializable(
  genericArgumentFactories: true,
)
class ListModel<T> extends ListModelBase {
  final List<T> data;

  //생성자
  ListModel({
    required this.data,
  });

  ListModel copyWith({
    List<T>? data,
  }) {
    return ListModel(
      data: data ?? this.data,
    );
  }

  factory ListModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromjsonT) =>
      _$ListModelFromJson(json, fromjsonT);
}
