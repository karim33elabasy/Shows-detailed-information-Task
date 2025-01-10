import 'package:dio/dio.dart';
import 'package:employees_task/employee_model.dart';

class ApiServices {
  final String baseUrl = 'https://dummyjson.com/users';
  final dio = Dio();
  
  Future<List<EmployeeModel>> getEmployees() async {
    List<EmployeeModel> employees = [];
    try {
      var response = await dio.get(baseUrl);
      response.data['users'].forEach((employee){
        employees.add(EmployeeModel.fromJson(employee));
      });
    } catch (e){
      print(e.toString());
    }
    return employees;
  }
  
}