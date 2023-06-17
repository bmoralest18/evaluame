import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'est_estrellas_calificacion_model.dart';
export 'est_estrellas_calificacion_model.dart';

class EstEstrellasCalificacionWidget extends StatefulWidget {
  const EstEstrellasCalificacionWidget({
    Key? key,
    this.idSubject,
    this.idUser,
    this.email,
  }) : super(key: key);

  final int? idSubject;
  final String? idUser;
  final String? email;

  @override
  _EstEstrellasCalificacionWidgetState createState() =>
      _EstEstrellasCalificacionWidgetState();
}

class _EstEstrellasCalificacionWidgetState
    extends State<EstEstrellasCalificacionWidget> {
  late EstEstrellasCalificacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EstEstrellasCalificacionModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<SubjectRow>>(
      future: SubjectTable().querySingleRow(
        queryFn: (q) => q.eq(
          'id_subject',
          widget.idSubject,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: Color(0xFD183756),
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<SubjectRow> estEstrellasCalificacionSubjectRowList =
            snapshot.data!;
        final estEstrellasCalificacionSubjectRow =
            estEstrellasCalificacionSubjectRowList.isNotEmpty
                ? estEstrellasCalificacionSubjectRowList.first
                : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFD183756),
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                'Calificacion por estrellas',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 0.0, 0.0),
                        child: Text(
                          'Docente :',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontSize: 18.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 20.0, 0.0, 0.0),
                        child: FutureBuilder<ApiCallResponse>(
                          future: GetTeacherByIdCall.call(
                            idUsera: estEstrellasCalificacionSubjectRow
                                ?.idTeacher
                                ?.toString(),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              );
                            }
                            final textGetTeacherByIdResponse = snapshot.data!;
                            return Text(
                              getJsonField(
                                textGetTeacherByIdResponse.jsonBody,
                                r'''$[:].name''',
                              ).toString(),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFA8A8B4),
                                    fontSize: 18.0,
                                  ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 10.0, 0.0, 10.0),
                        child: Text(
                          '${dateTimeFormat('jm', estEstrellasCalificacionSubjectRow?.initTime)} - ${dateTimeFormat('jm', estEstrellasCalificacionSubjectRow?.endTime)} ${dateTimeFormat('d/M/y', estEstrellasCalificacionSubjectRow?.endTime)}',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).lineColor,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 349.3,
                          height: 580.7,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 0.0, 0.0),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: GetClassByIdCall.call(
                                        idClass:
                                            estEstrellasCalificacionSubjectRow
                                                ?.idClass
                                                ?.toString(),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        final textGetClassByIdResponse =
                                            snapshot.data!;
                                        return Text(
                                          'Materia: ${getJsonField(
                                            textGetClassByIdResponse.jsonBody,
                                            r'''$[:].name''',
                                          ).toString()}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Poppins',
                                                fontSize: 20.0,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 10.0),
                                      child: Text(
                                        'Califica la clase impartida por el profesor de 1 a 5 estrellas',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RatingBar.builder(
                                      onRatingUpdate: (newValue) => setState(
                                          () =>
                                              _model.ratingBarValue = newValue),
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Color(0xFFE2E11C),
                                      ),
                                      direction: Axis.horizontal,
                                      initialRating: _model.ratingBarValue ??=
                                          0.0,
                                      unratedColor: Color(0xFF9E9E9E),
                                      itemCount: 5,
                                      itemSize: 60.0,
                                      glowColor: Color(0xFFE2E11C),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 100.0),
                                      child: FutureBuilder<List<ScoreStarsRow>>(
                                        future:
                                            ScoreStarsTable().querySingleRow(
                                          queryFn: (q) => q
                                              .eq(
                                                'id_teacher',
                                                estEstrellasCalificacionSubjectRow
                                                    ?.idTeacher,
                                              )
                                              .eq(
                                                'id_class',
                                                estEstrellasCalificacionSubjectRow
                                                    ?.idClass,
                                              ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ScoreStarsRow>
                                              buttonScoreStarsRowList =
                                              snapshot.data!;
                                          final buttonScoreStarsRow =
                                              buttonScoreStarsRowList.isNotEmpty
                                                  ? buttonScoreStarsRowList
                                                      .first
                                                  : null;
                                          return FFButtonWidget(
                                            onPressed: () async {
                                              _model.apiResultClass =
                                                  await GetClassByIdCall.call(
                                                idClass:
                                                    estEstrellasCalificacionSubjectRow
                                                        ?.idClass
                                                        ?.toString(),
                                              );
                                              await StarTable().insert({
                                                'rating': _model.ratingBarValue
                                                    ?.round(),
                                                'id_subject': widget.idSubject,
                                                'id_teacher':
                                                    estEstrellasCalificacionSubjectRow
                                                        ?.idTeacher,
                                                'id_class':
                                                    estEstrellasCalificacionSubjectRow
                                                        ?.idClass,
                                                'name_class':
                                                    GetClassByIdCall.nameClass(
                                                  (_model.apiResultClass
                                                          ?.jsonBody ??
                                                      ''),
                                                ).toString(),
                                              });
                                              if ((estEstrellasCalificacionSubjectRow
                                                          ?.idTeacher ==
                                                      buttonScoreStarsRow
                                                          ?.idTeacher) &&
                                                  (estEstrellasCalificacionSubjectRow
                                                          ?.idClass ==
                                                      buttonScoreStarsRow
                                                          ?.idClass)) {
                                                await ScoreStarsTable().update(
                                                  data: {
                                                    'score':
                                                        functions.sumaRanking(
                                                            buttonScoreStarsRow!
                                                                .score!,
                                                            _model
                                                                .ratingBarValue!
                                                                .round()),
                                                  },
                                                  matchingRows: (rows) => rows
                                                      .eq(
                                                        'id_teacher',
                                                        estEstrellasCalificacionSubjectRow
                                                            ?.idTeacher,
                                                      )
                                                      .eq(
                                                        'id_class',
                                                        estEstrellasCalificacionSubjectRow
                                                            ?.idClass,
                                                      ),
                                                );
                                              } else {
                                                await ScoreStarsTable().insert({
                                                  'id_teacher':
                                                      estEstrellasCalificacionSubjectRow
                                                          ?.idTeacher,
                                                  'id_class':
                                                      estEstrellasCalificacionSubjectRow
                                                          ?.idClass,
                                                  'score': _model.ratingBarValue
                                                      ?.round(),
                                                  'name_class': GetClassByIdCall
                                                      .nameClass(
                                                    (_model.apiResultClass
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString(),
                                                });
                                              }

                                              context.pushNamed(
                                                'Menu_Calificaciones',
                                                queryParameters: {
                                                  'idSubject': serializeParam(
                                                    widget.idSubject,
                                                    ParamType.int,
                                                  ),
                                                  'idUser': serializeParam(
                                                    widget.idUser,
                                                    ParamType.String,
                                                  ),
                                                  'email': serializeParam(
                                                    widget.email,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              setState(() {});
                                            },
                                            text: 'Enviar',
                                            options: FFButtonOptions(
                                              width: 150.0,
                                              height: 50.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                              elevation: 2.0,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'Menu_Calificaciones',
                                    queryParameters: {
                                      'idSubject': serializeParam(
                                        widget.idSubject,
                                        ParamType.int,
                                      ),
                                      'idUser': serializeParam(
                                        widget.idUser,
                                        ParamType.String,
                                      ),
                                      'email': serializeParam(
                                        widget.email,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_back_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      size: 35.0,
                                    ),
                                    Text(
                                      'Regresar',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
