
import 'package:flutter/foundation.dart';

final String TABLE_EMPLOYEE = 'tbl_employee';
final String COL_EMP_ID = 'emp_id';
final String COL_EMP_NAME = 'emp_name';
final String COL_EMP_AGE = 'emp_age';
final String COL_EMP_PHONE = 'emp_phone';

class EmployeeModel {
  int id;
  String name;
  int age;
  String phone;

  EmployeeModel({
    this.id,
    @required this.name,
    this.age,
    this.phone
  });

  EmployeeModel.fromMap(Map<String, dynamic> map) {
    id = map[COL_EMP_ID];
    name = map[COL_EMP_NAME];
    age = map[COL_EMP_AGE];
    phone = map[COL_EMP_PHONE];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      COL_EMP_NAME: name,
      COL_EMP_AGE: age,
      COL_EMP_PHONE: phone,
    };
    if(id != null) {
      map[COL_EMP_ID] = id;
    }
    return map;
  }

  @override
  String toString() {
    return 'EmployeeModel{id: $id, name: $name, age: $age, phone: $phone}';
  }


}