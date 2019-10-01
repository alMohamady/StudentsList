import 'package:flutter/material.dart';
import 'package:students_list/screens/student_detil.dart';
import 'dart:async';
import 'package:students_list/models/student.dart';
import 'package:students_list/utilities/sql_helper.dart';
import 'package:sqflite/sqflite.dart';

class StudentsList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentsState();
  }
}

class StudentsState extends State<StudentsList> {

  SQL_Helper helper = new SQL_Helper();
  List<Student> studentsList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (studentsList == null) {
      studentsList = new List<Student>();
      updateListView();
    }

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Students"),
        ),
        body: getStudentsList(),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToStudent(Student('', '', 0, ''), "Add New Student");
          },
          tooltip: 'Add Student',
          child: Icon(Icons.add),
        )
    );
  }

  ListView getStudentsList() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isPassed(this.studentsList[position].pass),
                child: getIcon(this.studentsList[position].pass),
              ),
              title: Text(this.studentsList[position].name),
              subtitle: Text(this.studentsList[position].description + " | " +
                  this.studentsList[position].date),
              trailing:
              GestureDetector(
                child: Icon(Icons.delete, color: Colors.grey,),
                onTap: () {
                  _delete(context, this.studentsList[position]);
                },
              )
              ,
              onTap: () {
                navigateToStudent(this.studentsList[position], "Edit Student");
              },
            ),

          );
        });
  }

  Color isPassed(int value) {
    switch (value) {
      case 1:
        return Colors.amber;
        break;
      case 2:
        return Colors.red;
        break;
      default:
        return Colors.amber;
    }
  }

  Icon getIcon(int value) {
    switch (value) {
      case 1:
        return Icon(Icons.check);
        break;
      case 2:
        return Icon(Icons.close);
        break;
      default:
        return Icon(Icons.check);
    }
  }

  void _delete(BuildContext context, Student student) async {
    int ressult = await helper.deleteStudent(student.id);
    if (ressult != 0) {
      _showSenckBar(context, "Student has been deleted");
      updateListView();
    }
  }

  void _showSenckBar(BuildContext context, String msg) {
    final snackBar = SnackBar(content: Text(msg),);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void updateListView() {
    final Future<Database> db = helper.initializedDatabase();
    db.then((database) {
      Future<List<Student>> students = helper.getStudentList();
      students.then((theList) {
        setState(() {
          this.studentsList = theList;
          this.count = theList.length;
        });
      });
    });
  }

  void navigateToStudent(Student student, String appTitle) async {
    bool result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) {
      return StudentDetail(student, appTitle);
    }));

    if (result) {
      updateListView();
    }
  }
}