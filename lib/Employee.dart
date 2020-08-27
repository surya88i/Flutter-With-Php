import 'dart:convert';

List<Employee> employeeFromJson(String str) => List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
    Employee({
        this.rno,
        this.firstname,
        this.lastname,
        this.mobile,
    });

    String rno;
    String firstname;
    String lastname;
    String mobile;

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        rno: json["rno"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        mobile: json["mobile"],
    );

    Map<String, dynamic> toJson() => {
        "rno": rno,
        "firstname": firstname,
        "lastname": lastname,
        "mobile": mobile,
    };
}