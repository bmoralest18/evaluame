import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _mail = prefs.getString('ff_mail') ?? _mail;
    });
    _safeInit(() {
      _valorConfirmado =
          prefs.getString('ff_valorConfirmado') ?? _valorConfirmado;
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      _idUser = prefs.getString('ff_idUser') ?? _idUser;
    });
    _safeInit(() {
      _idStudent = prefs.getInt('ff_idStudent') ?? _idStudent;
    });
    _safeInit(() {
      _respetuoso = prefs.getInt('ff_respetuoso') ?? _respetuoso;
    });
    _safeInit(() {
      _amable = prefs.getInt('ff_amable') ?? _amable;
    });
    _safeInit(() {
      _responsable = prefs.getInt('ff_responsable') ?? _responsable;
    });
    _safeInit(() {
      _paciente = prefs.getInt('ff_paciente') ?? _paciente;
    });
    _safeInit(() {
      _honesto = prefs.getInt('ff_honesto') ?? _honesto;
    });
    _safeInit(() {
      _alegre = prefs.getInt('ff_alegre') ?? _alegre;
    });
    _safeInit(() {
      _creativo = prefs.getInt('ff_creativo') ?? _creativo;
    });
    _safeInit(() {
      _dinamico = prefs.getInt('ff_dinamico') ?? _dinamico;
    });
    _safeInit(() {
      _puntual = prefs.getInt('ff_puntual') ?? _puntual;
    });
    _safeInit(() {
      _compresivo = prefs.getInt('ff_compresivo') ?? _compresivo;
    });
    _safeInit(() {
      _datePicker = prefs.containsKey('ff_datePicker')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_datePicker')!)
          : _datePicker;
    });
    _safeInit(() {
      _idAvatar = prefs.getInt('ff_idAvatar') ?? _idAvatar;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _mail = '';
  String get mail => _mail;
  set mail(String _value) {
    _mail = _value;
    prefs.setString('ff_mail', _value);
  }

  String _valorConfirmado = 'Email not confirmed';
  String get valorConfirmado => _valorConfirmado;
  set valorConfirmado(String _value) {
    _valorConfirmado = _value;
    prefs.setString('ff_valorConfirmado', _value);
  }

  String _token = '';
  String get token => _token;
  set token(String _value) {
    _token = _value;
    prefs.setString('ff_token', _value);
  }

  String _idUser = '';
  String get idUser => _idUser;
  set idUser(String _value) {
    _idUser = _value;
    prefs.setString('ff_idUser', _value);
  }

  int _idStudent = 0;
  int get idStudent => _idStudent;
  set idStudent(int _value) {
    _idStudent = _value;
    prefs.setInt('ff_idStudent', _value);
  }

  int _respetuoso = 0;
  int get respetuoso => _respetuoso;
  set respetuoso(int _value) {
    _respetuoso = _value;
    prefs.setInt('ff_respetuoso', _value);
  }

  int _amable = 0;
  int get amable => _amable;
  set amable(int _value) {
    _amable = _value;
    prefs.setInt('ff_amable', _value);
  }

  int _responsable = 0;
  int get responsable => _responsable;
  set responsable(int _value) {
    _responsable = _value;
    prefs.setInt('ff_responsable', _value);
  }

  int _paciente = 0;
  int get paciente => _paciente;
  set paciente(int _value) {
    _paciente = _value;
    prefs.setInt('ff_paciente', _value);
  }

  int _honesto = 0;
  int get honesto => _honesto;
  set honesto(int _value) {
    _honesto = _value;
    prefs.setInt('ff_honesto', _value);
  }

  int _alegre = 0;
  int get alegre => _alegre;
  set alegre(int _value) {
    _alegre = _value;
    prefs.setInt('ff_alegre', _value);
  }

  int _creativo = 0;
  int get creativo => _creativo;
  set creativo(int _value) {
    _creativo = _value;
    prefs.setInt('ff_creativo', _value);
  }

  int _dinamico = 0;
  int get dinamico => _dinamico;
  set dinamico(int _value) {
    _dinamico = _value;
    prefs.setInt('ff_dinamico', _value);
  }

  int _puntual = 0;
  int get puntual => _puntual;
  set puntual(int _value) {
    _puntual = _value;
    prefs.setInt('ff_puntual', _value);
  }

  int _compresivo = 0;
  int get compresivo => _compresivo;
  set compresivo(int _value) {
    _compresivo = _value;
    prefs.setInt('ff_compresivo', _value);
  }

  DateTime? _datePicker = DateTime.fromMillisecondsSinceEpoch(1672592400000);
  DateTime? get datePicker => _datePicker;
  set datePicker(DateTime? _value) {
    _datePicker = _value;
    _value != null
        ? prefs.setInt('ff_datePicker', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_datePicker');
  }

  int _idAvatar = 0;
  int get idAvatar => _idAvatar;
  set idAvatar(int _value) {
    _idAvatar = _value;
    prefs.setInt('ff_idAvatar', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
