import 'package:employees_task/employee_model.dart';
import 'package:flutter/material.dart';
import 'api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  List<EmployeeModel> employees = [];
  @override
  void initState() {
    super.initState();
    getEmployees();
  }

  getEmployees()async{
    employees = await ApiServices().getEmployees();
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: isLoading? const Center(child: CircularProgressIndicator(),):ListView.builder(
          itemBuilder: (context,state)=> ListTile(
            title: Text("${employees[state].firstName} ${employees[state].lastName}",),
            subtitle: Text(employees[state].email),
            leading: const Icon(Icons.person),
            trailing: employees[state].gender == 'male' ? const Icon(Icons.male) : const Icon(Icons.female),
          ),
          itemCount: employees.length,
        ),
      ),
    );
  }
}
