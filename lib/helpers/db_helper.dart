

import 'package:masteringflutter17/models/employee_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {

  static final String CREATE_TABLE_EMPLOYEE = '''create table $TABLE_EMPLOYEE(
  $COL_EMP_ID integer primary key autoincrement,
  $COL_EMP_NAME text not null,
  $COL_EMP_AGE integer not null,
  $COL_EMP_PHONE text not null)''';

  static Future<Database> open() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'employee.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(CREATE_TABLE_EMPLOYEE);
    });
  }

  static Future<int> insertEmployee(String tableName, Map<String, dynamic> data) async {
    final db = await open();
    return db.insert(tableName, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<EmployeeModel>> getAllEmployees() async {
    final db = await open();
    final List<Map<String, dynamic>> empMap = await db.query(TABLE_EMPLOYEE, orderBy: COL_EMP_NAME);
    return List.generate(empMap.length, (index) {
      return EmployeeModel.fromMap(empMap[index]);
    });
  }
}