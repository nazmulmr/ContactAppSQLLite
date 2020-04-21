
import 'package:flutter/material.dart';
import 'package:masteringflutter17/models/employee_model.dart';

class EmployeeItem extends StatefulWidget {
  final EmployeeModel employeeModel;

  EmployeeItem(this.employeeModel);

  @override
  _EmployeeItemState createState() => _EmployeeItemState();
}

class _EmployeeItemState extends State<EmployeeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      elevation: 3,
      child: ListTile(
        title: Text(widget.employeeModel.name),
      ),
    );
  }
}
