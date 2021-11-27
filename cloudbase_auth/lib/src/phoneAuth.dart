import 'dart:async';

import 'baseAuth.dart';
import 'interface.dart';

import 'package:cloudbase_core/cloudbase_core.dart';

class PhoneAuthProvider extends AuthProvider {
  PhoneAuthProvider(CloudBaseCore core) : super(core);

  Future<CloudBaseResponse> sendPhoneCode(String phoneNumber) async {
    CloudBaseResponse res = await CloudBaseRequest(super.core!)
        .postWithoutAuth('auth.sendPhoneCode', {
      'phoneNumber': phoneNumber,
    });

    if (res.code != null) {
      throw new CloudBaseException(code: res.code, message: res.message);
    }
    return res;
  }

  Future<CloudBaseResponse> signUpWithPhoneCode(
      String phoneNumber, String phoneCode, String password) async {
    CloudBaseResponse res = await CloudBaseRequest(super.core!)
        .postWithoutAuth4Phone('auth.signIn', {
      'signMethod': "SIGNUP",
      'phoneNumber': phoneNumber,
      'phoneCode': phoneCode,
      'password': password,
    });

    if (res.code != null) {
      throw new CloudBaseException(code: res.code, message: res.message);
    }
    return res;
  }

  Future<CloudBaseAuthState> signInWithPhoneCodeOrPassword(
      String? phoneNumber, String? phoneCode, String? password) async {
    CloudBaseResponse res = await CloudBaseRequest(super.core!)
        .postWithoutAuth4Phone('auth.signIn', {
      'signMethod': "SIGNIN",
      'phoneNumber': phoneNumber,
      'phoneCode': phoneCode,
      'password': password
    });

    if (res.code != null) {
      throw new CloudBaseException(code: res.code, message: res.message);
    }

    if (res.data != null && res.data['refresh_token'] != null) {
      String? newRefreshToken = res.data['refresh_token'];
      await setAuthType(CloudBaseAuthType.PHONE);
      await setRefreshToken(newRefreshToken);
      await refreshAccessToken();

      return CloudBaseAuthState(
          authType: CloudBaseAuthType.PHONE, refreshToken: newRefreshToken);
    } else {
      throw CloudBaseException(
          code: CloudBaseExceptionCode.AUTH_FAILED, message: '手机号登录失败');
    }
  }

  Future<CloudBaseResponse> forceResetPwdByPhoneCode(
      String phoneNumber, String phoneCode, String password) async {
    CloudBaseResponse res = await CloudBaseRequest(super.core!)
        .postWithoutAuth4Phone('auth.signIn', {
      'signMethod': "FORCERESETPWD",
      'phoneNumber': phoneNumber,
      'phoneCode': phoneCode,
      'password': password,
    });

    if (res.code != null) {
      throw new CloudBaseException(code: res.code, message: res.message);
    }
    return res;
  }
}
