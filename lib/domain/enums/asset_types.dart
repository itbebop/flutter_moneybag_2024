enum AssetType {
  total('Total'),
  income('Income'),
  expense('Expense');

  final String displayName;

  const AssetType(this.displayName);
}
