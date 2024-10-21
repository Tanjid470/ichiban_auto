import 'package:flutter/material.dart';
import 'package:ichiban_auto/config/responsive_scale.dart';
import 'package:ichiban_auto/const/app_color.dart';

import '../../const/dynamic_font.dart';

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
              Text("Car Details", style: TextStyle(fontSize: TextSize.font22(context),
                  fontWeight: FontWeight.bold,
                color: AppColors.baseColorRed,

              )),
              ResponsiveScale.of(context).verticalGap(context, 1.5),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Brand',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => carMake = value,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Model',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => carModel = value,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Year',
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
              Text("Customer Details", style: TextStyle(fontSize: TextSize.font22(context),color: AppColors.baseColorRed, fontWeight: FontWeight.bold)),
              ResponsiveScale.of(context).verticalGap(context, 1.5),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Customer name',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => customerName = value,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contact number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                onSaved: (value) => phoneNumber = value,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => email = value,
              ),


              // Booking Details Section
              const SizedBox(height: 10),
              Text("Booking Details", style: TextStyle(fontSize: TextSize.font22(context),color: AppColors.baseColorRed, fontWeight: FontWeight.bold)),
              ResponsiveScale.of(context).verticalGap(context, 1.5),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Booking Title',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => bookingTitle = value,
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.baseColorGrey),
                  borderRadius: BorderRadius.circular(5), // Apply border radius here
                ),
                child: ListTile(
                  title: Text(startDateTime == null
                      ? 'Select Start DateTime'
                      : 'Start: ${startDateTime.toString()}'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => _selectDateTime(context, true),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.baseColorGrey),
                  borderRadius: BorderRadius.circular(5), // Apply border radius here
                ),
                child: ListTile(
                  title: Text(
                    endDateTime == null
                        ? 'Select End DateTime'
                        : 'End: ${endDateTime.toString()}',
                  ),
                  trailing: const Icon(Icons.calendar_month_sharp),
                  onTap: () => _selectDateTime(context, false),
                ),
              ),

              const SizedBox(height: 16),

              // Mechanic Assignment Section
              Text("Assign Mechanic", style: TextStyle(fontSize: TextSize.font22(context),color: AppColors.baseColorRed, fontWeight: FontWeight.bold)),
              ResponsiveScale.of(context).verticalGap(context, 1.5),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
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
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.baseColorRed,
                      AppColors.baseColorRed,
                    ], // Replace with your desired gradient colors
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.baseColorGrey,
                      offset: Offset(2, 2.5)
                    )
                  ]
                ),
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Process the form data
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Booking Submitted')));
                    }
                  },
                  child: Text('Submit',
                    style: TextStyle(color: Colors.white,
                      fontSize: TextSize.font22(context),
                      fontWeight: FontWeight.w800
                    ),
                    
                  ),
                ),
              ),
              const SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}
