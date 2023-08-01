class CountryCodes {
  final String flag;
  final String code;

  CountryCodes(this.flag, this.code);

  static List<CountryCodes> all = [
    CountryCodes("🇳🇬", "+234"),
    CountryCodes("🇺🇸", "+1"),
  ];
}
