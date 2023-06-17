import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';

import '/backend/supabase/supabase.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Color(0xFFF2D996),
                child: Image.asset(
                  'assets/images/Isotipo_ups.png',
                  fit: BoxFit.contain,
                ),
              ),
            )
          : PrimeraInicioWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Color(0xFFF2D996),
                    child: Image.asset(
                      'assets/images/Isotipo_ups.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PrimeraInicioWidget(),
          routes: [
            FFRoute(
              name: 'Inicio_sesion',
              path: 'inicioSesion',
              builder: (context, params) => InicioSesionWidget(),
            ),
            FFRoute(
              name: 'Perfiles_estudiante',
              path: 'perfilesEstudiante',
              builder: (context, params) => PerfilesEstudianteWidget(
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Sentimiento_calificar_docente',
              path: 'sentimientoCalificarDocente',
              builder: (context, params) => SentimientoCalificarDocenteWidget(
                idSubject: params.getParam('idSubject', ParamType.int),
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Lista_materias_estud',
              path: 'listaMateriasEstud',
              builder: (context, params) => ListaMateriasEstudWidget(
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'est_dosco_calificacion',
              path: 'estDoscoCalificacion',
              builder: (context, params) => EstDoscoCalificacionWidget(
                idSubject: params.getParam('idSubject', ParamType.int),
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Perfil_docente',
              path: 'perfilDocente',
              builder: (context, params) => PerfilDocenteWidget(
                nameDocente: params.getParam('nameDocente', ParamType.String),
                idUser: params.getParam('idUser', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Menu_Calificaciones',
              path: 'menuCalificaciones',
              builder: (context, params) => MenuCalificacionesWidget(
                idSubject: params.getParam('idSubject', ParamType.int),
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Resena_Docente',
              path: 'resenaDocente',
              builder: (context, params) => ResenaDocenteWidget(
                idTeacher: params.getParam('idTeacher', ParamType.int),
                nameDocente: params.getParam('nameDocente', ParamType.String),
                idUser: params.getParam('idUser', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Docente_Estrellas',
              path: 'docenteEstrellas',
              builder: (context, params) => DocenteEstrellasWidget(
                idTeacher: params.getParam('idTeacher', ParamType.int),
                nameDocente: params.getParam('nameDocente', ParamType.String),
                idUser: params.getParam('idUser', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'resena_calificacion',
              path: 'resenaCalificacion',
              builder: (context, params) => ResenaCalificacionWidget(
                idSubject: params.getParam('idSubject', ParamType.int),
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'est_estrellas_calificacion',
              path: 'estEstrellasCalificacion',
              builder: (context, params) => EstEstrellasCalificacionWidget(
                idSubject: params.getParam('idSubject', ParamType.int),
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Don_bosco_Docente',
              path: 'donBoscoDocente',
              builder: (context, params) => DonBoscoDocenteWidget(
                idUser: params.getParam('idUser', ParamType.String),
                nameDocente: params.getParam('nameDocente', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'data_table',
              path: 'dataTable',
              builder: (context, params) => DataTableWidget(
                idTeacher: params.getParam('idTeacher', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Resena_DocenteCopy',
              path: 'resenaDocenteCopy',
              builder: (context, params) => ResenaDocenteCopyWidget(
                idTeacher: params.getParam('idTeacher', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'Docente_Sentimientos',
              path: 'docenteSentimientos',
              builder: (context, params) => DocenteSentimientosWidget(
                idTeacher: params.getParam('idTeacher', ParamType.int),
                nameDocente: params.getParam('nameDocente', ParamType.String),
                idUser: params.getParam('idUser', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Menu_CalificacionesCopy',
              path: 'menuCalificacionesCopy',
              builder: (context, params) => MenuCalificacionesCopyWidget(
                idSubject: params.getParam('idSubject', ParamType.int),
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Docente_EstrellasCopy',
              path: 'docenteEstrellasCopy',
              builder: (context, params) => DocenteEstrellasCopyWidget(
                idTeacher: params.getParam('idTeacher', ParamType.int),
                nameDocente: params.getParam('nameDocente', ParamType.String),
                idUser: params.getParam('idUser', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Editar_perfil_estudiante',
              path: 'editarPerfilEstudiante',
              builder: (context, params) => EditarPerfilEstudianteWidget(
                idStudent: params.getParam('idStudent', ParamType.int),
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Editar_perfil_docente',
              path: 'editarPerfilDocente',
              builder: (context, params) => EditarPerfilDocenteWidget(
                idTeacher: params.getParam('idTeacher', ParamType.int),
                idUser: params.getParam('idUser', ParamType.String),
                email: params.getParam('email', ParamType.String),
                nameDocente: params.getParam('nameDocente', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Lista_materias_docente_activar',
              path: 'listaMateriasDocenteActivar',
              builder: (context, params) => ListaMateriasDocenteActivarWidget(
                idTeacher: params.getParam('idTeacher', ParamType.int),
                idUser: params.getParam('idUser', ParamType.String),
                nameDocente: params.getParam('nameDocente', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'primeraInicio',
              path: 'primeraInicio',
              builder: (context, params) => PrimeraInicioWidget(),
            ),
            FFRoute(
              name: 'visual_docnetes_publico',
              path: 'visualDocnetesPublico',
              builder: (context, params) => VisualDocnetesPublicoWidget(),
            ),
            FFRoute(
              name: 'Reporte_Resenas',
              path: 'reporteResenas',
              builder: (context, params) => ReporteResenasWidget(),
            ),
            FFRoute(
              name: 'Reporte_DonBosco',
              path: 'reporteDonBosco',
              builder: (context, params) => ReporteDonBoscoWidget(),
            ),
            FFRoute(
              name: 'Menu_Reportes',
              path: 'menuReportes',
              builder: (context, params) => MenuReportesWidget(
                nameDocente: params.getParam('nameDocente', ParamType.String),
                idUser: params.getParam('idUser', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Reporte_Sentimientos',
              path: 'reporteSentimientos',
              builder: (context, params) => ReporteSentimientosWidget(
                idTeacher: params.getParam('idTeacher', ParamType.int),
                nameDocente: params.getParam('nameDocente', ParamType.String),
                idUser: params.getParam('idUser', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Reporte_Estrellas',
              path: 'reporteEstrellas',
              builder: (context, params) => ReporteEstrellasWidget(
                idTeacher: params.getParam('idTeacher', ParamType.int),
                nameDocente: params.getParam('nameDocente', ParamType.String),
                idUser: params.getParam('idUser', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
