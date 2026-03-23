import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  // List of todos: each item contains a title and completion status
  final List<Map<String, dynamic>> _todos = [];

  // Controller for text input
  final TextEditingController _controller = TextEditingController();

  // Add a new todo item
  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add({
          "title": _controller.text,
          "done": false,
        });
        _controller.clear();
      });
    }
  }

  // Remove a todo item
  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  // Toggle completion status (checkbox)
  void _toggleTodo(int index) {
    setState(() {
      _todos[index]["done"] = !_todos[index]["done"];
    });
  }

  @override
  void dispose() {
    // Dispose controller to free memory
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [

          // Input section
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _addTodo,
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ),

          // Todo list
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {

                final todo = _todos[index];

                return ListTile(
                  leading: Checkbox(
                    value: todo["done"],
                    onChanged: (_) => _toggleTodo(index),
                  ),
                  title: Text(
                    todo["title"],
                    style: TextStyle(
                      decoration: todo["done"]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeTodo(index),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}