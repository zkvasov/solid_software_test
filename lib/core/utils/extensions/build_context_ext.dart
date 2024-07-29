import 'package:flutter/material.dart';
import 'package:solid_software/l10n/generated/app_localizations.dart';

/// [BuildContext] extension
extension BuildContextExt on BuildContext {
  /// returns current localizations
  AppLocalizations get strings => AppLocalizations.of(this);
}
