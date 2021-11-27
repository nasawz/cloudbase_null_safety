## Cloudbase Core for Flutter

[![Pub](https://img.shields.io/pub/v/cloudbase_core)]()

[腾讯云·云开发](https://www.cloudbase.net/)的 Flutter 插件，更多的云开发 Flutter 插件请见[云开发文档](https://docs.cloudbase.net/api-reference/flutter/install.html)。

## 安装

在 flutter 项目的 `pubspec.yaml` 文件的 `dependencies` 中添加

```yaml
dependencies:
  cloudbase_core: ^0.0.4
```

## 简单示例

```dart
import 'package:cloudbase_core/cloudbase_core.dart';

// 初始化 CloudBase
CloudBaseCore core = CloudBaseCore.init({
    // 填写你的云开发 env
    'env': 'your-env-id'
});
```

## 详细文档

[云开发·初始化](https://docs.cloudbase.net/api-reference/flutter/initialization.html)
