import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start usuarioApp Group Code

class UsuarioAppGroup {
  static String baseUrl = 'https://ryywbodcbzdifqoaarye.supabase.co/auth/v1/';
  static Map<String, String> headers = {
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQwOTE2MzksImV4cCI6MTk4OTY2NzYzOX0.PT8r9YjcgJq78w-hKm1BOV2m8cApAPeNTYDb4_5_DOE',
  };
  static AppRegistroUsuarioCall appRegistroUsuarioCall =
      AppRegistroUsuarioCall();
  static AppLoginUsuarioCall appLoginUsuarioCall = AppLoginUsuarioCall();
}

class AppRegistroUsuarioCall {
  Future<ApiCallResponse> call({
    String? correo = '',
    String? contrasenia = '',
  }) {
    final body = '''
{
  "email": "${correo}",
  "password": "${contrasenia}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'appRegistroUsuario',
      apiUrl: '${UsuarioAppGroup.baseUrl}signup',
      callType: ApiCallType.POST,
      headers: {
        ...UsuarioAppGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AppLoginUsuarioCall {
  Future<ApiCallResponse> call({
    String? correo = '',
    String? contrasenia = '',
  }) {
    final body = '''
{
  "email": "${correo}",
  "password": "${contrasenia}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'appLoginUsuario',
      apiUrl: '${UsuarioAppGroup.baseUrl}token?grant_type=password',
      callType: ApiCallType.POST,
      headers: {
        ...UsuarioAppGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic validarLogin(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  dynamic validarDescip(dynamic response) => getJsonField(
        response,
        r'''$.error_description''',
      );
  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.access_token''',
      );
  dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.user.email''',
      );
  dynamic idUser(dynamic response) => getJsonField(
        response,
        r'''$.user.id''',
      );
  dynamic refreshToken(dynamic response) => getJsonField(
        response,
        r'''$.refresh_token''',
      );
}

/// End usuarioApp Group Code

class GetStudentCall {
  static Future<ApiCallResponse> call({
    String? idUsera = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getStudent',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Student?id_user=eq.${idUsera}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idUsuario(dynamic response) => getJsonField(
        response,
        r'''$[:].id_user''',
      );
  static dynamic seudonimo(dynamic response) => getJsonField(
        response,
        r'''$[:].pseudonim''',
      );
  static dynamic idEstudiante(dynamic response) => getJsonField(
        response,
        r'''$[:].id_student''',
      );
  static dynamic idAvatar(dynamic response) => getJsonField(
        response,
        r'''$[:].id_avatar''',
      );
}

class GetStudentByEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getStudentByEmail',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Student?email=eq.${email}',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idUsuario(dynamic response) => getJsonField(
        response,
        r'''$[:].id_user''',
      );
  static dynamic seudonimo(dynamic response) => getJsonField(
        response,
        r'''$[:].pseudonim''',
      );
  static dynamic idEstudiante(dynamic response) => getJsonField(
        response,
        r'''$[:].id_student''',
      );
  static dynamic idAvatar(dynamic response) => getJsonField(
        response,
        r'''$[:].id_avatar''',
      );
}

class GetTeacherCall {
  static Future<ApiCallResponse> call({
    String? idUsera = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTeacher',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Teacher?id_user=eq.${idUsera}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idUserTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].id_user''',
      );
  static dynamic surnameTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].surname''',
      );
  static dynamic nameTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  static dynamic idTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].id_teacher''',
      );
  static dynamic idAvatar(dynamic response) => getJsonField(
        response,
        r'''$[:].id_avatar''',
      );
}

class GetTeacherByEmailCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTeacherByEmail',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Teacher?email=eq.${email}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idUserTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].id_user''',
      );
  static dynamic surnameTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].surname''',
      );
  static dynamic nameTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  static dynamic idTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].id_teacher''',
      );
  static dynamic idAvatar(dynamic response) => getJsonField(
        response,
        r'''$[:].id_avatar''',
      );
}

class GetTeacherByIdCall {
  static Future<ApiCallResponse> call({
    String? idUsera = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTeacherById',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Teacher?id_teacher=eq.${idUsera}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idUserTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].id_user''',
      );
  static dynamic surnameTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].surname''',
      );
  static dynamic nameTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
}

class GetClassByIdCall {
  static Future<ApiCallResponse> call({
    String? idClass = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getClassById',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Class?id_class=eq.${idClass}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nameClass(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  static dynamic idClass(dynamic response) => getJsonField(
        response,
        r'''$[:].id_class''',
      );
  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
      );
  static dynamic informationClass(dynamic response) => getJsonField(
        response,
        r'''$[:].information''',
      );
}

class GetClassByNameCall {
  static Future<ApiCallResponse> call({
    String? name = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getClassByName',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Class?name=eq.${name}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nameClass(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
      );
  static dynamic idClass(dynamic response) => getJsonField(
        response,
        r'''$[:].id_class''',
      );
  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
      );
  static dynamic informationClass(dynamic response) => getJsonField(
        response,
        r'''$[:].information''',
      );
}

class GetSubjectByIdCall {
  static Future<ApiCallResponse> call({
    String? idSubject = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getSubjectById',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Subject?id_subject=eq.${idSubject}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$[:].created_at''',
      );
  static dynamic idSubject(dynamic response) => getJsonField(
        response,
        r'''$[:].id_subject''',
      );
  static dynamic idTeacher(dynamic response) => getJsonField(
        response,
        r'''$[:].id_teacher''',
      );
  static dynamic idStudent(dynamic response) => getJsonField(
        response,
        r'''$[:].id_student''',
      );
  static dynamic initTime(dynamic response) => getJsonField(
        response,
        r'''$[:].initTime''',
      );
  static dynamic endTime(dynamic response) => getJsonField(
        response,
        r'''$[:].endTime''',
      );
  static dynamic isQualified(dynamic response) => getJsonField(
        response,
        r'''$[:].isQualified''',
      );
}

class GetMateriaIdEstudianteCall {
  static Future<ApiCallResponse> call({
    int? idStudent,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMateriaIdEstudiante',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Subject?id_student=eq.${idStudent}&select=*',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic nameMateria(dynamic response) => getJsonField(
        response,
        r'''$[:].name''',
        true,
      );
  static dynamic infMateria(dynamic response) => getJsonField(
        response,
        r'''$[:].information''',
        true,
      );
}

class UpdateUserCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? token = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateUser',
      apiUrl: 'https://ryywbodcbzdifqoaarye.supabase.co/auth/v1/user',
      callType: ApiCallType.PUT,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic auth(dynamic response) => getJsonField(
        response,
        r'''$.aud''',
      );
  static dynamic email(dynamic response) => getJsonField(
        response,
        r'''$.email''',
      );
}

class ForgottenPasswordCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) {
    final body = '''
{"email": "${email}"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'forgottenPassword',
      apiUrl: 'https://ryywbodcbzdifqoaarye.supabase.co/auth/v1/recover',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQwOTE2MzksImV4cCI6MTk4OTY2NzYzOX0.PT8r9YjcgJq78w-hKm1BOV2m8cApAPeNTYDb4_5_DOE',
        'Content-Type': 'application/json',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUserAPICall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getUserAPI',
      apiUrl: 'https://ryywbodcbzdifqoaarye.supabase.co/auth/v1/user',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQwOTE2MzksImV4cCI6MTk4OTY2NzYzOX0.PT8r9YjcgJq78w-hKm1BOV2m8cApAPeNTYDb4_5_DOE',
        'Authorization': 'Bearer 0.10.148.20',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetIdsClassByIdTeacherCall {
  static Future<ApiCallResponse> call({
    String? idTeacher = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getIdsClassByIdTeacher',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Class?id_teacher=eq.${idTeacher}&select=id_class',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQwOTE2MzksImV4cCI6MTk4OTY2NzYzOX0.PT8r9YjcgJq78w-hKm1BOV2m8cApAPeNTYDb4_5_DOE',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQwOTE2MzksImV4cCI6MTk4OTY2NzYzOX0.PT8r9YjcgJq78w-hKm1BOV2m8cApAPeNTYDb4_5_DOE',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic listIdClass(dynamic response) => getJsonField(
        response,
        r'''$[:].id_class''',
        true,
      );
}

class GetGrupsTeacherCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getGrupsTeacher',
      apiUrl:
          'https://ryywbodcbzdifqoaarye.supabase.co/rest/v1/Teacher?select=id_teacher',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5eXdib2RjYnpkaWZxb2FhcnllIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NDA5MTYzOSwiZXhwIjoxOTg5NjY3NjM5fQ.KnP_s53xPzqw1WQsFTi79TuUakCHAZnFeLH5sU03iQs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
