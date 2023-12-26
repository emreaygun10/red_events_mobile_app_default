/// Module enum
enum ModuleEnum {
  /// modules packages
  gen('gen'),
  core('core'),
  common('common'),
  widgets('widgets');

  ///font value
  final String value;

  // ignore: sort_constructors_first
  const ModuleEnum(this.value);
}
