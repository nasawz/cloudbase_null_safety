## Cloudbase Storage for Flutter

[![Pub](https://img.shields.io/pub/v/cloudbase_storage)]()

[腾讯云·云开发](https://www.cloudbase.net/)的 Flutter 插件，更多的云开发 Flutter 插件请见[云开发文档](https://docs.cloudbase.net/api-reference/flutter/install.html)。

## 安装

在 flutter 项目的 `pubspec.yaml` 文件的 `dependencies` 中添加

```yaml
dependencies:
  cloudbase_core: ^0.0.4
  cloudbase_storage: ^0.0.2
```

## 简单示例

```dart
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_storage/cloudbase_storage.dart';
import 'package:path_provider/path_provider.dart';

// 获取 flutter Document 路径
// 参考文档：https://flutter.cn/docs/cookbook/persistence/reading-writing-files
_getDocumentsPath() async {
  final directory = await getApplicationDocumentsDirectory();
  String path = directory.path;
  return path;
}

void main() async {
  CloudBaseCore core = CloudBaseCore.init({'env': 'your-env-id'});
  
  // 匿名登录
  CloudBaseAuth auth = CloudBaseAuth(core);
  CloudBaseAuthState authState = await auth.getAuthState();

  if (authState == null) {
      await auth.signInAnonymously();
  }

  // 上传文件
  CloudBaseStorage storage = CloudBaseStorage(core);
  String path = await _getDocumentsPath();
  await storage.uploadFile(
      cloudPath: 'flutter/data.txt', filePath: '$path/data.txt');
}
```

## 详细文档

[云开发·文件存储](https://docs.cloudbase.net/api-reference/flutter/storage.html)