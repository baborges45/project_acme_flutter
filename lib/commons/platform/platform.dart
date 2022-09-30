import 'dart:io' show Platform;

bool _forceMaterial = false;
void changeToMaterialPlatform() {
  _forceMaterial = true;
  _forceCupertino = false;
}

bool _forceCupertino = false;
void changeToCupertinoPlatform() {
  _forceCupertino = true;
  _forceMaterial = false;
}

void changeToAutoDetectPlatform() {
  _forceMaterial = false;
  _forceCupertino = false;
}

bool get isMaterial =>
    _forceMaterial || (!_forceCupertino && Platform.isAndroid);

bool get isCupertino => _forceCupertino || (!_forceMaterial && Platform.isIOS);
