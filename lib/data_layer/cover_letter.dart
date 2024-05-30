class CoverLetterData {
  final int pk;
  final Fields fields;

  CoverLetterData({required this.pk, required this.fields});

  factory CoverLetterData.fromJson(Map<String, dynamic> json) {
    return CoverLetterData(
      pk: json['pk'],
      fields: Fields.fromJson(json['fields']),
    );
  }
}

class Fields {
  final int user;
  final String job_title;
  final String company_name;
  final String job_description;
  final String name;
  final String phone_number;
  final String email;
  final String address;
  final String experience;

  Fields(
      {required this.user,
      required this.job_title,
      required this.company_name,
      required this.job_description,
      required this.name,
      required this.phone_number,
      required this.email,
      required this.address,
      required this.experience});

  factory Fields.fromJson(Map<String, dynamic> json) {
    return Fields(
        user: json['user'],
        job_title: json['job_title'],
        company_name: json['company_name'],
        job_description: json['job_description'],
        name: json['name'],
        phone_number: json['phone_number'],
        address: json['address'],
        experience: json['experience'],
        email: json['email']);
  }
  Map<String, dynamic>? toJson() {
    return {
      'user': this.user,
      'job_title': this.job_title,
      'company_name': this.company_name,
      'job_description': this.job_description,
      'name': this.name,
      'phone_number': this.phone_number,
      'email': this.email,
      'address': this.address,
      'experience': this.address,
    };
  }
}
