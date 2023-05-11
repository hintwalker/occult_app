part of tauari_translate;

String translate(String text, {TextCase textCase = TextCase.undefined}) {
  switch (textCase) {
    case TextCase.undefined:
      return text.tr();
    case TextCase.lowerCase:
      return text.tr().toLowerCase();
    case TextCase.uperCase:
      return text.tr().toUpperCase();
    default:
      return text.tr();
  }
}
