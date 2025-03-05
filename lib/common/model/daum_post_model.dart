import 'package:json_annotation/json_annotation.dart';

part 'daum_post_model.g.dart';

//베이스 모델
class DaumPostModelBase {}

//로딩
class DaumPostModelLoading extends DaumPostModelBase {}

//에러
class DaumPostModelError extends DaumPostModelBase {
  final String message;

  DaumPostModelError({
    required this.message,
  });
}

//모델
@JsonSerializable()
class DaumPostModel extends DaumPostModelBase {
  final String address;
  final String roadAddress;
  final String jibunAddress;
  final String sido;
  final String sigungu;
  final String bname;
  final String roadname;
  final String buildingName;
  final String addressEnglish;
  final String roadAddressEnglish;
  final String jibunAddressEnglish;
  final String sidoEnglish;
  final String sigunguEnglish;
  final String bnameEnglish;
  final String roadnameEnglish;
  final String zonecode;
  final String sigunguCode;
  final String bcode;
  final String buildingCode;
  final String roadnameCode;
  final String addressType;
  final String apartment;
  final String userLanguageType;
  final String userSelectedType;

  DaumPostModel(
      this.address,
      this.roadAddress,
      this.jibunAddress,
      this.sido,
      this.sigungu,
      this.bname,
      this.roadname,
      this.buildingName,
      this.addressEnglish,
      this.roadAddressEnglish,
      this.jibunAddressEnglish,
      this.sidoEnglish,
      this.sigunguEnglish,
      this.bnameEnglish,
      this.roadnameEnglish,
      this.zonecode,
      this.sigunguCode,
      this.bcode,
      this.buildingCode,
      this.roadnameCode,
      this.addressType,
      this.apartment,
      this.userLanguageType,
      this.userSelectedType);

  factory DaumPostModel.fromJson(Map<String, dynamic> json) =>
      _$DaumPostModelFromJson(json);
}
