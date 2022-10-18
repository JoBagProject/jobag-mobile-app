import 'package:flutter/material.dart';
import 'package:mi_proyecto/screens/shared/sidebar_menu_screen.dart';
import 'package:mi_proyecto/widgets/widgets.dart';

class EmployeeSavedJobs extends StatelessWidget {
  const EmployeeSavedJobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trabajos Guardados'),
        backgroundColor: Colors.indigo,
      ),
      drawer: SidebarMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.indigo
                ),
              ),
            ),
          ),
          Column(
            children: [
              ],
            )
          ] 
        ),
      ),
    );
  }
}