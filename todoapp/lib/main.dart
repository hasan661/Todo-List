import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
 
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Todo=TextEditingController();
   List todo=[
  ];

  void addtodo() {
    // todo.add(Todo.text);
    // print(todo);
    setState(() {
      todo.add(Todo.text);
      
    });
    
  }
  void clearlist(num index){
    setState(() {
      todo.remove(todo.elementAt(int.parse('$index')));
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.greenAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hasan's TODO List",),
        
        ),
        
        body: 
        SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 10,),
            TextField(
              controller: Todo,
            
            
            
            ),
            IconButton(onPressed: addtodo, icon: Icon(Icons.add),)
           ,
          
       (todo.isEmpty)?
      Text("No Wishes Added Yet")
      

      :
      Container(
        height: 450,
        child: ListView.builder(itemBuilder: (ctx,index){
          return Container(
            decoration: BoxDecoration(
            border: Border.all(
            color: Colors.black,
            )),
            padding: EdgeInsets.all(10),
            
            child: todo.isEmpty? 
              
              Text(todo[index])
              :Row(children: [
              
              Text(todo[index]),
              IconButton(onPressed: ()=>{clearlist(index)}, icon: Icon(Icons.delete))
              


            ]
          ));
          
        },itemCount: todo.length,),
      ),
        
          ],),
        )
        
        
      ),
    );
  }
}
