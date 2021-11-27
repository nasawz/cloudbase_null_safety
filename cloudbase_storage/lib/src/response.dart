import 'dart:convert';

class CloudBaseStorageRes<T> {
  String? requestId;
  T? data;

  CloudBaseStorageRes({this.requestId, this.data});

  @override
  String toString() {
    return jsonEncode({'requestId': this.requestId, 'data': data});
  }
}

class UploadRes {
  String? fileId;

  UploadRes({this.fileId});

  UploadRes.fromMap(Map<String, dynamic> map) {
    this.fileId = map['fileId'];
  }
}

class UploadMetadata {
  String? url;

  String? token;

  String? authorization;

  String? fileId;

  String? cosFileId;

  UploadMetadata(
      {this.url, this.token, this.authorization, this.fileId, this.cosFileId});

  UploadMetadata.fromMap(Map<String, dynamic> map) {
    this.url = map['url'];
    this.token = map['token'];
    this.authorization = map['authorization'];
    this.fileId = map['fileId'];
    this.cosFileId = map['cosFileId'];
  }

  @override
  String toString() {
    return jsonEncode({
      'url': url,
      'token': token,
      'authorization': authorization,
      'fileId': fileId,
      'cosFileId': cosFileId
    });
  }

  toJson() {
    return jsonEncode({
      'url': url,
      'token': token,
      'authorization': authorization,
      'fileId': fileId,
      'cosFileId': cosFileId
    });
  }
}

class DownloadMetadata {
  String? fileId;
  String? downloadUrl;

  DownloadMetadata.fromMap(Map map) {
    fileId = map['fileid'];
    downloadUrl = map['download_url'];
  }

  @override
  String toString() {
    return jsonEncode({'fileId': fileId, 'downloadUrl': downloadUrl});
  }

  toJson() {
    return jsonEncode({'fileId': fileId, 'downloadUrl': downloadUrl});
  }
}

class DeleteMetadata {
  String? fileId;
  // code 为 'SUCCESS' 表示删除成功
  String? code;

  DeleteMetadata.fromMap(Map map) {
    fileId = map['fileid'];
    code = map['code'];
  }

  @override
  String toString() {
    return jsonEncode({'fileId': fileId, 'code': code});
  }

  toJson() {
    return jsonEncode({'fileId': fileId, 'code': code});
  }
}
