import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Wishlist extends StatefulWidget {
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final List todo = [];

  void clearlist(num index) {
    setState(() {
      todo.remove(todo.elementAt(int.parse('$index')));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Todo = TextEditingController();

    void addtodo() {
      setState(() {
        todo.add(Todo.text);
      });
    }

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
                                        ListTile(
                                          title: Text(
                                            todo[index],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                          ),
                                          subtitle: Text(DateFormat.yMd()
                                              .format(DateTime.now())),
                                          trailing: IconButton(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              onPressed: () =>
                                                  {clearlist(index)},
                                              icon: Icon(Icons.delete)),
                                        )
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
