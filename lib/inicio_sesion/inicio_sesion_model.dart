import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InicioSesionModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for contrasenia widget.
  TextEditingController? contraseniaController;
  late bool contraseniaVisibility;
  String? Function(BuildContext, String?)? contraseniaControllerValidator;
  // Stores action output result for [Backend Call - API (appLoginUsuario)] action in Button widget.
  ApiCallResponse? apiResult4ah;
  // Stores action output result for [Backend Call - API (getStudent)] action in Button widget.
  ApiCallResponse? aPIStudent;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    contraseniaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    emailController?.dispose();
    contraseniaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
