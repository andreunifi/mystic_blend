import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'edit_vendor_widget.dart' show EditVendorWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditVendorModel extends FlutterFlowModel<EditVendorWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for VendorName widget.
  TextEditingController? vendorNameController1;
  String? Function(BuildContext, String?)? vendorNameController1Validator;
  String? _vendorNameController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rnlyuz0b' /* Field is required */,
      );
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for VendorBIO widget.
  TextEditingController? vendorBIOController1;
  String? Function(BuildContext, String?)? vendorBIOController1Validator;
  String? _vendorBIOController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'c44i0719' /* Field is required */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }
    if (val.length > 300) {
      return FFLocalizations.of(context).getText(
        'au6eryv1' /* Your bio cannot exceed the max... */,
      );
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for VendorName widget.
  TextEditingController? vendorNameController2;
  String? Function(BuildContext, String?)? vendorNameController2Validator;
  // State field(s) for VendorBIO widget.
  TextEditingController? vendorBIOController2;
  String? Function(BuildContext, String?)? vendorBIOController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    vendorNameController1Validator = _vendorNameController1Validator;
    vendorBIOController1Validator = _vendorBIOController1Validator;
  }

  void dispose() {
    vendorNameController1?.dispose();
    vendorBIOController1?.dispose();
    vendorNameController2?.dispose();
    vendorBIOController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
