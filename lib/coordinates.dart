class Coordinates {
  int r;
  int c;

  Coordinates({required this.r, required this.c});

  @override
  int get hashCode => r.hashCode ^ c.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Coordinates && runtimeType == other.runtimeType && r == other.r && c == other.c;
}
