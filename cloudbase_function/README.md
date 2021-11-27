## Cloudbase Function for Flutter

[![Pub](https://img.shields.io/pub/v/cloudbase_function)]()

[腾讯云·云开发](https://www.cloudbase.net/)的 Flutter 插件，更多的云开发 Flutter 插件请见[云开发文档](https://docs.cloudbase.net/api-reference/flutter/install.html)。

## 安装

在 flutter 项目的 `pubspec.yaml` 文件的 `dependencies` 中添加

```yaml
dependencies:
  cloudbase_core: ^0.0.4
  cloudbase_function: ^0.0.2
```

## 简单示例

```dart
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_function/cloudbase_function.dart';

void main() async {
  CloudBaseCore core = CloudBaseCore.init({'env': 'your-env-id'});

  // 匿名登录
  CloudBaseAuth auth = CloudBaseAuth(core);
  CloudBaseAuthState authState = await auth.getAuthState();

  if (authState == null) {
      await auth.signInAnonymously();
  }

  // 云函数调用
  CloudBaseFunction function = CloudBaseFunction(core);
  Map<String, dynamic> data = {'a': 1, 'b': 2};
  CloudBaseResponse res = await function.callFunction('sum', data);
  print(res.data) // { sum: 3 }
}
```

## 详细文档

[云开发·云函数](https://docs.cloudbase.net/api-reference/flutter/functions.html)