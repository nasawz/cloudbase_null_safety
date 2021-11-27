import 'dart:async';

import 'package:cloudbase_core/cloudbase_core.dart';

class AuthConstant {
  static const String ACCESS_TOKEN = 'access_token';
  static const String ACCESS_TOKEN_EXPIRE = 'access_token_expire';
  static const String REFRESH_TOKEN = 'refresh_token';
  static const String REFRESH_TOKEN_EXPIRE = 'refresh_token_expire';
  static const String ANONYMOUS_UUID = 'anonymous_uuid';
  static const String LOGIN_TYPE = 'login_type';
}

class AuthCache {
  final String? accessTokenKey;
  final String? accessTokenExpireKey;
  final String? refreshTokenKey;
  final String? refreshTokenExpireKey;
  final String? anonymousUuidKey;
  final String? loginTypeKey;

  CloudBaseStore? _store;

  AuthCache(
      {this.accessTokenKey,
      this.accessTokenExpireKey,
      this.refreshTokenKey,
      this.refreshTokenExpireKey,
      this.anonymousUuidKey,
      this.loginTypeKey});

  factory AuthCache.init(CloudBaseConfig config) {
    assert(config != null && config.envId != null && config.envId!.isNotEmpty);

    String? envId = config.envId;

    return AuthCache(
      accessTokenKey: '${envId}_${AuthConstant.ACCESS_TOKEN}',
      accessTokenExpireKey: '${envId}_${AuthConstant.ACCESS_TOKEN_EXPIRE}',
      refreshTokenKey: '${envId}_${AuthConstant.REFRESH_TOKEN}',
      refreshTokenExpireKey: '${envId}_${AuthConstant.REFRESH_TOKEN_EXPIRE}',
      anonymousUuidKey: '${envId}_${AuthConstant.ANONYMOUS_UUID}',
      loginTypeKey: '${envId}_${AuthConstant.LOGIN_TYPE}',
    );
  }

  /// 获取缓存
  Future<dynamic> getStore(String? key) async {
    if (_store == null) {
      _store = await CloudBaseStore().init();
    }

    if (key == this.loginTypeKey) {
      int? index = await (_store!.get(key) as Future<dynamic>);
      return index != null ? CloudBaseAuthType.values[index] : null;
    } else {
      return _store!.get(key);
    }
  }

  /// 设置缓存
  Future<dynamic> setStore(String? key, dynamic value) async {
    if (_store == null) {
      _store = await CloudBaseStore().init();
    }

    if (key == this.loginTypeKey) {
      value = (value as CloudBaseAuthType).index;
    }

    return _store!.set(key, value);
  }

  /// 删除缓存
  Future<dynamic> removeStore(String key) async {
    if (_store == null) {
      _store = await CloudBaseStore().init();
    }

    return _store!.remove(key);
  }

  /// 删除所有缓存
  Future<dynamic> removeAllStore() async {
    if (_store == null) {
      _store = await CloudBaseStore().init();
    }

    return _store!.clear();
  }
}
