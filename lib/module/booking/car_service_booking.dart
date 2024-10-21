import 'package:flutter/material.dart';

class CarServiceForm extends StatefulWidget {
  const CarServiceForm({super.key});

  @override
  CarServiceFormState createState() => CarServiceFormState();
}

class CarServiceFormState extends State<CarServiceForm> {
  final _formKey = GlobalKey<FormState>();
  String? carMake, carModel, carYear, registrationPlate;
  String? customerName, phoneNumber, email;
  String? bookingTitle;
  DateTime? startDateTime, endDateTime;
  String? assignedMechanic;
  List<String> mechanics = ['Mechanic A', 'Mechanic B', 'Mechanic C'];

  Future<void> _selectDateTime(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDateTime = picked;
        } else {
          endDateTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Servicing Booking'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("Car Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Car Make',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => carMake = value,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Car Model',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => carModel = value,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Car Year',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => carYear = value,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Registration Plate',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => registrationPlate = value,
              ),
              const SizedBox(height: 16),

              // Customer Details Section
              const Text("Customer Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Customer Name',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => customerName = value,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                onSaved: (value) => phoneNumber = value,
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value,
              ),


              // Booking Details Section
              const Text("Booking Details", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Booking Title',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => bookingTitle = value,
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Text(startDateTime == null
                    ? 'Select Start DateTime'
                    : 'Start: ${startDateTime.toString()}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDateTime(context, true),
              ),
              ListTile(
                title: Text(endDateTime == null
                    ? 'Select End DateTime'
                    : 'End: ${endDateTime.toString()}'),
                trailing: Icon(Icons.calendar_today),
                onTap: () => _selectDateTime(context, false),
              ),
              SizedBox(height: 16),

              // Mechanic Assignment Section
              Text("Assign Mechanic", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Assign Mechanic',
                  border: OutlineInputBorder(),
                ),
                items: mechanics.map((String mechanic) {
                  return DropdownMenuItem<String>(
                    value: mechanic,
                    child: Text(mechanic),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    assignedMechanic = value;
                  });
                },
              ),
              SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the form data
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Booking Submitted')));
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
