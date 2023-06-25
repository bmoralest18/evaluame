import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarPerfilEstudianteModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for seudo widget.
  TextEditingController? seudoController;
  String? Function(BuildContext, String?)? seudoControllerValidator;
  // State field(s) for contrasenia widget.
  TextEditingController? contraseniaController;
  late bool contraseniaVisibility;
  String? Function(BuildContext, String?)? contraseniaControllerValidator;
  // Stores action output result for [Backend Call - API (updateUser)] action in Button widget.
  ApiCallResponse? apiResultv87;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    contraseniaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    seudoController?.dispose();
    contraseniaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
