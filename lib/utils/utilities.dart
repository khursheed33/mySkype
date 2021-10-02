class Utilities {
  static String getUserName(String email) {
    return "live:${email.split("@")[0]}";
  }

  static String getInitials(String? name) {
    final List<String> _names = name!.split(" ");
    final firstName = _names[0];
    final lastName = _names[1];

    return firstName[0] + lastName[0];
  }
}
