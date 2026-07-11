import 'package:flutter/material.dart';
import 'task_manager.dart';


void main() {
  runApp(TaskApp());
}

class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  final TaskManager manager = TaskManager();
  final TextEditingController titleController = TextEditingController();
  
  bool isUrgent = false;
  String selectedCategory = "Personal";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFF5F6FA),
        appBar: AppBar(
          elevation: 4,
          backgroundColor: Colors.blueAccent,
          title: Text(
            "Task Manager",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),

        body: Column(
          children: [
            // --- INPUT CARD ---
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    // Task title input
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        labelText: "Enter new task",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),

                    SizedBox(height: 12),

                    // Urgent switch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Is this task urgent?",
                          style: TextStyle(fontSize: 16),
                        ),
                        Switch(
                          value: isUrgent,
                          activeColor: Colors.redAccent,
                          onChanged: (value) {
                            setState(() {
                              isUrgent = value;
                            });
                          },
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    // Category dropdown
                    DropdownButtonFormField<String>(
                      value: selectedCategory,
                      decoration: InputDecoration(
                        labelText: "Category",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      items: [
                        "Work",
                        "Personal",
                        "Study",
                        "Shopping",
                        "Other",
                      ].map((cat) {
                        return DropdownMenuItem(
                          value: cat,
                          child: Text(cat),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                    ),

                    SizedBox(height: 12),

                    // Add button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            manager.addTask(
                              titleController.text,
                              isUrgent,
                              selectedCategory,
                            );
                            titleController.clear();
                            isUrgent = false;
                            selectedCategory = "Personal";
                          });
                        },
                        icon: Icon(Icons.add),
                        label: Text("Add Task"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // --- TASK LIST ---
            Expanded(
              child: manager.tasks.isEmpty
                  ? Center(
                      child: Text(
                        "No tasks yet 🚀",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      itemCount: manager.tasks.length,
                      itemBuilder: (context, index) {
                        final task = manager.tasks[index];

                        return Container(
                          margin: EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              )
                            ],
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(16),

                            // Checkbox
                            leading: Checkbox(
                              value: task.isDone,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  manager.toggleDone(task.id);
                                });
                              },
                            ),

                            title: Text(
                              task.title,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                decoration: task.isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: task.isUrgent
                                    ? Colors.redAccent
                                    : Colors.black,
                              ),
                            ),

                            subtitle: Text(
                              "${task.category} • ${task.isUrgent ? 'Urgent' : 'Not urgent'} • ID: ${task.id}",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),

                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.redAccent),
                              onPressed: () {
                                setState(() {
                                  manager.deleteTask(task.id);
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
