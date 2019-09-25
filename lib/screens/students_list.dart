import 'package:flutter/material.dart';
import 'package:students_list/screens/student_detil.dart';


class StudentsList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentsState();
  }
}

class StudentsState extends State<StudentsList>{

  int count =0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Students"),
        ),
        body: getStudentsList(),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateToStudent("Add New Student");
          },
          tooltip: 'Add Student',
          child: Icon(Icons.add),
        )
    );
  }

  ListView getStudentsList(){

    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position){
          return Card (
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Icon(Icons.check),
              ),
              title: Text("The first student"),
              subtitle: Text("data form this Student"),
              trailing: Icon(Icons.delete, color: Colors.grey,),
              onTap: (){
                navigateToStudent("Edit Student");
              },
            ),

          );

        });
  }

  void navigateToStudent(String appTitle){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return StudentDetail(appTitle);
    }));
  }
}