
import 'package:flutter/material.dart';
import 'package:masteringflutter17/helpers/db_helper.dart';
import 'package:masteringflutter17/models/employee_model.dart';

class AddEmployeeScreen extends StatefulWidget {
  @override
  _AddEmployeeScreenState createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  final employee = EmployeeModel();
  var _formKey = GlobalKey<FormState>();

  void _saveEmployee() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      DBHelper.insertEmployee(TABLE_EMPLOYEE, employee.toMap()).then((id) {
        if(id > 0) {
          print('saved');
          Navigator.of(context).pop();
        }else{
          print('not saved');
        }
      });
      //print(employee);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Employee'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter employee name',
                ),
                validator: (value) {
                  if(value.isEmpty || value.length < 6){
                    return 'Please provide a valid name';
                  }
                  return null;
                },
                onSaved: (value) {
                  employee.name = value;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter employee age',
                ),
                validator: (value) {
                  if(value.isEmpty){
                    return 'Please provide a valid name';
                  }
                  if(int.parse(value) < 21) {
                    return 'Employee should be atleast 21 years old';
                  }
                  return null;
                },
                onSaved: (value) {
                  employee.age = int.parse(value);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Enter mobile number',
                ),
                validator: (value) {
                  if(value.isEmpty || value.length < 11){
                    return 'Please provide a valid mobile number';
                  }
                  return null;
                },
                onSaved: (value) {
                  employee.phone = value;
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                child: Text('Save'),
                onPressed: _saveEmployee,
              ),
            ],
          ),
        )
      ),
    );
  }
}
