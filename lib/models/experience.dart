class Experience {
  final String company;
  final String role;
  final String duration;
  final List<String> projects;
  final List<String> achievements;
  final List<String> responsibilities;

  Experience({
    required this.company,
    required this.role,
    required this.duration,
    this.projects = const [],
    this.achievements = const [],
    this.responsibilities = const [],
  });
}
