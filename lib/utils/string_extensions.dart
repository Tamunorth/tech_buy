import 'package:tech_buy/utils/utility_functions.dart';

extension TechBuyStringUtils on String {
  bool get isNum => TechBuyUtils.isNum(this);

  bool get isNumericOnly => TechBuyUtils.isNumericOnly(this);

  bool get isAlphabetOnly => TechBuyUtils.isAlphabetOnly(this);

  bool get isBool => TechBuyUtils.isBool(this);

  bool get isVectorFileName => TechBuyUtils.isVector(this);

  bool get isImageFileName => TechBuyUtils.isImage(this);

  bool get isAudioFileName => TechBuyUtils.isAudio(this);

  bool get isVideoFileName => TechBuyUtils.isVideo(this);

  bool get isTxtFileName => TechBuyUtils.isTxt(this);

  bool get isDocumentFileName => TechBuyUtils.isWord(this);

  bool get isExcelFileName => TechBuyUtils.isExcel(this);

  bool get isPPTFileName => TechBuyUtils.isPPT(this);

  bool get isAPKFileName => TechBuyUtils.isAPK(this);

  bool get isPDFFileName => TechBuyUtils.isPDF(this);

  bool get isHTMLFileName => TechBuyUtils.isHTML(this);

  bool get isURL => TechBuyUtils.isURL(this);

  bool get isEmail => TechBuyUtils.isEmail(this);

  bool get isPhoneNumber => TechBuyUtils.isPhoneNumber(this);

  bool get isDateTime => TechBuyUtils.isDateTime(this);

  bool get isMD5 => TechBuyUtils.isMD5(this);

  bool get isSHA1 => TechBuyUtils.isSHA1(this);

  bool get isSHA256 => TechBuyUtils.isSHA256(this);

  bool get isBinary => TechBuyUtils.isBinary(this);

  bool get isIPv4 => TechBuyUtils.isIPv4(this);

  bool get isIPv6 => TechBuyUtils.isIPv6(this);

  bool get isHexadecimal => TechBuyUtils.isHexadecimal(this);

  bool get isPalindrom => TechBuyUtils.isPalindrom(this);

  bool get isPassport => TechBuyUtils.isPassport(this);

  bool get isCurrency => TechBuyUtils.isCurrency(this);

  bool get isCpf => TechBuyUtils.isCpf(this);

  bool get isCnpj => TechBuyUtils.isCnpj(this);

  bool isCaseInsensitiveContains(String b) =>
      TechBuyUtils.isCaseInsensitiveContains(this, b);

  bool isCaseInsensitiveContainsAny(String b) =>
      TechBuyUtils.isCaseInsensitiveContainsAny(this, b);

  String? get capitalize => TechBuyUtils.capitalize(this);

  String? get capitalizeFirst => TechBuyUtils.capitalizeFirst(this);

  String get removeAllWhitespace => TechBuyUtils.removeAllWhitespace(this);

  String? get camelCase => TechBuyUtils.camelCase(this);

  String? get paramCase => TechBuyUtils.paramCase(this);

  String numericOnly({bool firstWordOnly = false}) =>
      TechBuyUtils.numericOnly(this, firstWordOnly: firstWordOnly);

  String createPath([Iterable? segments]) {
    final path = startsWith('/') ? this : '/$this';
    return TechBuyUtils.createPath(path, segments);
  }
}
