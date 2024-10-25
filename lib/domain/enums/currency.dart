enum Currency {
  kr('KRW', '₩'),
  en('USD', '\$'),
  jp('JPY', '¥'),
  cn('CNY', '¥');

  final String currencyName;
  final String currentMark;

  const Currency(
    this.currencyName,
    this.currentMark,
  );
}
