import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final Todo = TextEditingController();

  final List todo = [];

  void addtodo() {
    setState(() {
      todo.add(Todo.text);
    });
  }

  void clearlist(num index) {
    setState(() {
      todo.remove(todo.elementAt(int.parse('$index')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: Todo,
          ),
          IconButton(
            onPressed: addtodo,
            icon: Icon(Icons.add),
          ),
          (todo.isEmpty)
              ? Text("No Wishes Added Yet")
              : Container(
                  height: 450,
                  child: ListView.builder(

                    itemBuilder: (ctx, index) {
                      return Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: Theme.of(context).accentColor,
                          )),
                          // padding: EdgeInsets.all(10),
                          
                          child: Container(
                            width: double.infinity,
                            child: todo.isEmpty
                                ? Text(todo[index])
                                : Container(
                                  

                                  color: Theme.of(context).accentColor,
                                  child: Column(

                                      children: [
                                        Row(

                                          
                                          children: [

                                            Text(
                                              todo[index],
                                            ),
                                            IconButton(
                                              onPressed: () => {clearlist(index)},
                                              icon: Icon(Icons.delete)),
                                            
                                            IconButton(onPressed: (){
                                                  
                                                }, icon: Icon(Icons.check_box)),
                                             
                                            

                                          ],
                                        ),
                                        Text(
                                            DateFormat.yMd().format(DateTime.now()))
                                      ],
                                    ),
                                ),
                          ));
                    },
                    itemCount: todo.length,
                  ),
                ),
        ],
      ),
    );
  }
}
