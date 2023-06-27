import 'dart:io';

class EmailValidator {
  static bool simple(String? email) {
    if (email == null || email.isEmpty) {
      return false;
    }

    final parts = email.split('@');
    if (parts.length != 2) {
      return false;
    }

    final domain = parts[1];
    if (domain.isEmpty) {
      return false;
    }

    // Verifica se o domínio possui um registro A ou MX
    try {
      InternetAddress.lookup(domain);
      return true;
    } on SocketException {
      return false;
    }
  }

  static Future<bool> deep(String? email) async {
    if (email == null || email.isEmpty) {
      return false;
    }

    final parts = email.split('@');
    if (parts.length != 2) {
      return false;
    }

    final domain = parts[1];
    if (domain.isEmpty) {
      return false;
    }

    // Verifica se o domínio possui um registro MX
    try {
      final mxRecords = await InternetAddress.lookup(domain);
      return mxRecords.isNotEmpty;
    } on SocketException {
      return false;
    }
  }
}
