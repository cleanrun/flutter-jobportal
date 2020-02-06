import 'dart:convert';

import 'package:job_portal/models/category.dart';
import 'package:job_portal/models/company.dart';

class Job{
  final int id;
  final int id_company;
  final int id_category;
  final String job_name;
  final String job_description;
  final String requirements;
  final List<Company> company;
  final List<Category> category;

  Job({this.id,
      this.id_company,
      this.id_category,
      this.job_name,
      this.job_description,
      this.requirements,
      this.company,
      this.category
  });

  factory Job.fromJSON(Map<String, dynamic> json) {
    var company = json['company'] as List;
    var category = json['categories'] as List;

    return Job(
      id: json['id'],
      id_company: json['id_company'],
      id_category: json['id_category'],
      job_name: json['job_name'],
      job_description: json['job_description'],
      requirements: json['requirements'],
      company: company.map((i) => Company.fromJSON(i)).toList(),
      category: category.map((i) => Category.fromJSON(i)).toList(),
    );
  }
}