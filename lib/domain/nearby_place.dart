class NearByPlace {
  String name;
  String iconPath;
  NearByPlace({
    required this.name,
    required this.iconPath,
  });

  @override
  String toString() => 'NearByPlace(name: $name, iconPath: $iconPath)';

  NearByPlace copyWith({
    String? name,
    String? iconPath,
  }) {
    return NearByPlace(
      name: name ?? this.name,
      iconPath: iconPath ?? this.iconPath,
    );
  }
}
