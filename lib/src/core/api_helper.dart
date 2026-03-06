import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:doctor_app/src/core/auth_manager.dart';
import 'package:http/http.dart';

/// ===============================
/// AUTH HEADERS HELPER
/// ===============================
Future<Map<String, String>> _authHeaders({bool withAuth = true}) async {
  final token = await AuthManager.getToken();

  return {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    if (withAuth && token != null) 'Authorization': 'Bearer $token',
  };
}

/// ===============================
/// API HELPER
/// ===============================
class ApiHelper {
  final Duration _timeoutDuration = const Duration(seconds: 30);

  /// ===============================
  /// GET REQUEST
  /// ===============================
  Future<Response> getRequest({
    required String endpoint,
    bool withAuth = true,
  }) async {
    final headers = await _authHeaders(withAuth: withAuth);

    log('GET → $endpoint');
    log('Headers: $headers');

    try {
      return await get(
        Uri.parse(endpoint),
        headers: headers,
      ).timeout(_timeoutDuration);
    } catch (e, stackTrace) {
      log('GET Error: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  /// ===============================
  /// POST REQUEST
  /// ===============================
  Future<Response> postRequest({
    required String endpoint,
    dynamic data,
    bool withAuth = false,
  }) async {
    final headers = await _authHeaders(withAuth: withAuth);

    log('POST → $endpoint');
    log('Headers: $headers');
    log('Body: $data');

    try {
      return await post(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode(data),
      ).timeout(_timeoutDuration);
    } catch (e, stackTrace) {
      log('POST Error: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  /// ===============================
  /// PATCH REQUEST
  /// ===============================
  Future<Response> patchRequest({
    required String endpoint,
    dynamic data,
  }) async {
    final headers = await _authHeaders();

    log('PATCH → $endpoint');
    log('Headers: $headers');
    log('Body: $data');

    return await patch(
      Uri.parse(endpoint),
      headers: headers,
      body: jsonEncode(data),
    );
  }

  // Future<Response> patchRequest({
  //   required String endpoint,
  //   dynamic data,
  // }) async {
  //   final headers = await _authHeaders();

  //   log('PATCH → $endpoint');
  //   log('Headers: $headers');

  //   try {
  //     return await patch(
  //       Uri.parse(endpoint),
  //       headers: headers,
  //       body: jsonEncode(data),
  //     ).timeout(_timeoutDuration);
  //   } catch (e, stackTrace) {
  //     log('PATCH Error: $e', stackTrace: stackTrace);
  //     rethrow;
  //   }
  // }

  /// ===============================
  /// DELETE REQUEST
  /// ===============================
  Future<Response> deleteRequest({required String endpoint}) async {
    final headers = await _authHeaders();

    log('DELETE → $endpoint');
    log('Headers: $headers');

    try {
      return await delete(
        Uri.parse(endpoint),
        headers: headers,
      ).timeout(_timeoutDuration);
    } catch (e, stackTrace) {
      log('DELETE Error: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  /// ===============================
  /// PUT REQUEST
  /// ===============================
  Future<Response> putRequest({required String endpoint, dynamic data}) async {
    final headers = await _authHeaders();

    log('PUT → $endpoint');
    log('Headers: $headers');

    try {
      return await put(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode(data),
      ).timeout(_timeoutDuration);
    } catch (e, stackTrace) {
      log('PUT Error: $e', stackTrace: stackTrace);
      rethrow;
    }
  }

  /// ===============================
  /// MULTIPART / FILE UPLOAD
  /// ===============================
  Future<StreamedResponse> postFilesWithDataRequest({
    required String endpoint,
    required String fileJsonKey,
    required List<File> files,
    Map<String, String>? data,
  }) async {
    final token = await AuthManager.getToken();

    final request = MultipartRequest('POST', Uri.parse(endpoint));

    if (token != null) {
      request.headers['Authorization'] = 'Bearer $token';
    }

    request.headers['Accept'] = 'application/json';

    log('UPLOAD → $endpoint');
    log('Headers: ${request.headers}');

    for (final file in files) {
      request.files.add(
        await MultipartFile.fromPath(
          fileJsonKey,
          file.path,
          filename: file.path.split('/').last,
        ),
      );
    }

    if (data != null) {
      request.fields.addEntries(data.entries);
    }

    try {
      return await request.send().timeout(_timeoutDuration);
    } catch (e, stackTrace) {
      log('UPLOAD Error: $e', stackTrace: stackTrace);
      rethrow;
    }
  }
}
