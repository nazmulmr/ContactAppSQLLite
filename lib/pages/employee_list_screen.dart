
import 'package:flutter/material.dart';
import 'package:masteringflutter17/helpers/db_helper.dart';
import 'package:masteringflutter17/models/employee_model.dart';
import 'package:masteringflutter17/pages/add_employee_screen.dart';
import 'package:masteringflutter17/widgets/employee_item.dart';

class EmployeeListScreen extends StatefulWidget {
  @override
  _EmployeeListScreenState createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {

  List<EmployeeModel> empList = [];

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    DBHelper.getAllEmployees().then((eList) {
      setState(() {
        empList = eList;
      });
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.white,),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AddEmployeeScreen()
              ));
            },
          )
        ],
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            return EmployeeItem(empList[index]);
          },
        itemCount: empList.length,
      ),
    );
  }
}
