import 'package:local_auth/local_auth.dart';

class AuthController {
  final _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    if (await _isBiometricAvailable()) {
      await _getAvailableBiometricTypes();
      return await _authenticateUser();
    } else {
      return false;
    }
  }

  Future<bool> _isBiometricAvailable() async {
    try {
      bool isAvailable = await _auth.canCheckBiometrics;
      return isAvailable;
    } catch (ex) {
      return false;
    }
  }

  Future _getAvailableBiometricTypes() async {
    try {
      await _auth.getAvailableBiometrics();
    } catch (ex) {
      print(ex);
    }
  }

  Future<bool> _authenticateUser() async {
    try {
      bool isAuthenticated = await _auth.authenticateWithBiometrics(
        localizedReason: "Autenticação Necessária",
        useErrorDialogs: true,
        stickyAuth: true,
      );

      return isAuthenticated;
    } catch (ex) {
      print(ex);
      return false;
    }
  }
}
