import 'package:flutter/material.dart';

void main() {
  runApp(SelectionListApp());
}

class SelectionListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectionListScreen(),
    );
  }
}

class SelectionListScreen extends StatefulWidget {
  @override
  _SelectionListScreenState createState() => _SelectionListScreenState();
}

class _SelectionListScreenState extends State<SelectionListScreen> {
  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
  List<bool> selectedItems = List.generate(5, (index) => false);

  void toggleSelection(int index) {
    setState(() {
      selectedItems[index] = !selectedItems[index];
    });
  }

  int getSelectedItemCount() {
    return selectedItems.where((isSelected) => isSelected).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selection Screen"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onTap: () {
              toggleSelection(index);
            },
            tileColor: selectedItems[index] ? Colors.blue : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Selected Items"),
                content:
                Text("Number of selected items: ${getSelectedItemCount()}"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Close"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
