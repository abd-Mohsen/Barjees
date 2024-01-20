// to store the position of a stone
class Position {
  int r;
  int c;

  Position(this.r, this.c);

  @override
  int get hashCode => r.hashCode ^ c.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Position && runtimeType == other.runtimeType && r == other.r && c == other.c;
}
