enum UserType {
  free('Free'),
  paid('Paid'),
  etc('Etc');

  final String displayName;

  const UserType(this.displayName);
}
