import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walletwise/controllers/budget/savinggoal_controller.dart';
import 'package:walletwise/data/saving_goals.dart';
import 'package:walletwise/models/saving.dart';

class SavingScreen extends StatefulWidget {
  final Saving saving;
  const SavingScreen({required this.saving, super.key});

  @override
  State<SavingScreen> createState() => _SavingScreenState();
}

class _SavingScreenState extends State<SavingScreen> {
  final SavinggoalController savingController = Get.put(SavinggoalController());
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    // Initialize the form fields with the current saving data
    savingController.amount.text = widget.saving.amount.toString();
    savingController.endDate.text = widget.saving.date;
    savingController.name.text = widget.saving.name;
    savingController.note.text = widget.saving.note;
  }

  void _deleteSaving() {
    setState(() {
      SavingGoalData.savinglist.remove(widget.saving);
      Get.back(); // Go back to the previous screen
    });
  }

  void _toggleEditMode() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _discardChanges() {
    setState(() {
      // Revert the form fields to the original saving data
      savingController.amount.text = widget.saving.amount.toString();
      savingController.endDate.text = widget.saving.date;
      savingController.name.text = widget.saving.name;
      savingController.note.text = widget.saving.note;
      _toggleEditMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saving Goal'),
        actions: [
          if (!isEditing)
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: _toggleEditMode,
            ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _deleteSaving,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (isEditing)
              TextField(
                controller: savingController.name,
                decoration: InputDecoration(labelText: 'Title'),
              )
            else
              ListTile(
                title: Text('Title'),
                subtitle: Text(widget.saving.name),
              ),
            if (isEditing)
              TextField(
                controller: savingController.amount,
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              )
            else
              ListTile(
                title: Text('Amount'),
                subtitle: Text(widget.saving.amount.toString()),
              ),
            if (isEditing)
              TextField(
                controller: savingController.endDate,
                decoration: InputDecoration(labelText: 'End Date'),
              )
            else
              ListTile(
                title: Text('End Date'),
                subtitle: Text(widget.saving.date),
              ),
            if (isEditing)
              TextField(
                controller: savingController.note,
                decoration: InputDecoration(labelText: 'Note'),
              )
            else
              ListTile(
                title: Text('Note'),
                subtitle: Text(widget.saving.note),
              ),
            if (isEditing) SizedBox(height: 20),
            if (isEditing)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      savingController.edit();
                    },
                    child: Text('Update Saving'),
                  ),
                  ElevatedButton(
                    onPressed: _discardChanges,
                    child: Text('Discard Changes'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
