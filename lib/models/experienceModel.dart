class ExperienceModel {
  final int id;
  final String companyName;
  final String dessignation;
  final List<int> workingYears;
  final String description;

  ExperienceModel(
      {required this.id,
      required this.companyName,
      required this.dessignation,
      required this.workingYears,
      this.description =
          "Learned so many new skill and teamwork.Good thing is good job to get new creative ideas"});
}
