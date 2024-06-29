

abstract class FormEvent {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class ToggleStatus extends FormEvent {
  final String status;

  const ToggleStatus(this.status);

  @override
  List<Object> get props => [status];
}

class ToggleGender extends FormEvent {
  final String gender;

  const ToggleGender(this.gender);

  @override
  List<Object> get props => [gender];
}

class ToggleEnvironment extends FormEvent {
  final String environment;

  const ToggleEnvironment(this.environment);

  @override
  List<Object> get props => [environment];
}

class ToggleStyle extends FormEvent {
  final String style;

  const ToggleStyle(this.style);

  @override
  List<Object> get props => [style];
}

class ToggleGoal extends FormEvent {
  final String goal;

  const ToggleGoal(this.goal);

  @override
  List<Object> get props => [goal];
}

class ToggleSport extends FormEvent {
  final String sport;

  const ToggleSport(this.sport);

  @override
  List<Object> get props => [sport];
}

class ToggleSkillLevel extends FormEvent {
  final String skillLevel;

  const ToggleSkillLevel(this.skillLevel);

  @override
  List<Object> get props => [skillLevel];
}

class ToggleLocation extends FormEvent {
  final String location;

  const ToggleLocation(this.location);

  @override
  List<Object> get props => [location];
}

class UpdateHeight extends FormEvent {
  final int height;

  const UpdateHeight(this.height);

  @override
  List<Object> get props => [height];
}

class UpdateWeight extends FormEvent {
  final int weight;

  const UpdateWeight(this.weight);

  @override
  List<Object> get props => [weight];
}

class UpdateFullName extends FormEvent {
  final String fullName;

  const UpdateFullName(this.fullName);

  @override
  List<Object> get props => [fullName];
}

class UpdatePhoneNumber extends FormEvent {
  final String phoneNumber;

  const UpdatePhoneNumber(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class SubmitForm extends FormEvent {}
