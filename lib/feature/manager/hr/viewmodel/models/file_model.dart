class FileModel {
  FileModel({required this.name, this.value = false});

  final String name;
  final bool value;

  FileModel copyWith({
    String? name,
    bool? value,
  }) {
    return FileModel(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }
}
