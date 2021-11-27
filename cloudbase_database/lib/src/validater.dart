import 'package:cloudbase_core/cloudbase_core.dart';

///todo
class Validater {
  static dynamic isDocId(docId) {
    if (docId is String || docId is num) {
      return true;
    } else {
      /// todo throw
    }
  }

  static dynamic isFieldPath(String path) {}

  static dynamic isFieldOrder(String direction) {}

  static bool isGeopoint(String type, num? degree) {
    if (type == 'latitude' && degree!.abs() > 90) {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.INVALID_PARAM,
          message: 'latitude should be a number ranges from -90 to 90');
    } else if (type == 'longitude' && degree!.abs() > 180) {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.INVALID_PARAM,
          message: 'longitude should be a number ranges from -180 to 180');
    }

    return true;
  }

  static dynamic isUpdateDocumentData(dynamic) {}
}
