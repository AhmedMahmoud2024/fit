

class FormState {
  final List<String> selectedStatuses;
  final List<String> selectedTrainingEnvironments;
  final String selectedTrainingStyle;
  final String selectedGoal;
  final List<String> selectedSports;
  final String selectedSkillLevel;
  final int height;
  final int weight;
  final String gender;
  final String location;

  const FormState({
    this.selectedStatuses = const [],
    this.selectedTrainingEnvironments = const [],
    this.selectedTrainingStyle = '',
    this.selectedGoal = '',
    this.selectedSports = const [],
    this.selectedSkillLevel = '',
    this.height = 0,
    this.weight = 0,
    this.gender = '',
    this.location = '',
  });

  get email => null;

  get password => null;

  get phoneNumber => null;

  get fullName => null;

  FormState copyWith({
    List<String>? selectedStatuses,
    List<String>? selectedTrainingEnvironments,
    String? selectedTrainingStyle,
    String? selectedGoal,
    List<String>? selectedSports,
    String? selectedSkillLevel,
    int? height,
    int? weight,
    String? gender,
    String? location,
  }) {
    return FormState(
      selectedStatuses: selectedStatuses ?? this.selectedStatuses,
      selectedTrainingEnvironments: selectedTrainingEnvironments ?? this.selectedTrainingEnvironments,
      selectedTrainingStyle: selectedTrainingStyle ?? this.selectedTrainingStyle,
      selectedGoal: selectedGoal ?? this.selectedGoal,
      selectedSports: selectedSports ?? this.selectedSports,
      selectedSkillLevel: selectedSkillLevel ?? this.selectedSkillLevel,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      location: location ?? this.location,
    );
  }

  @override
  List<Object> get props => [
    selectedStatuses,
    selectedTrainingEnvironments,
    selectedTrainingStyle,
    selectedGoal,
    selectedSports,
    selectedSkillLevel,
    height,
    weight,
    gender,
    location,
  ];
}
