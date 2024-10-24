import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateEventScreen extends StatefulWidget {
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Event'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image upload button
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        _image != null ? FileImage(File(_image!.path)) : null,
                    child: _image == null
                        ? Icon(Icons.camera_alt, size: 50, color: Colors.pink)
                        : null,
                  ),
                ),
                SizedBox(height: 20),
                // Event Name field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Event Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter event name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Category dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Concert', 'Workshop', 'Festival']
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                SizedBox(height: 20),
                // Age limit and price fields
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Age Limit',
                          border: OutlineInputBorder(),
                        ),
                        items: ['All Ages', '18+', '21+']
                            .map((ageLimit) => DropdownMenuItem(
                                  value: ageLimit,
                                  child: Text(ageLimit),
                                ))
                            .toList(),
                        onChanged: (value) {},
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Price',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Phone number field
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // Artist Name field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Artist Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // Email field
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // Date of Event field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Date of Event',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                // City and Zone fields
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'City',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Zone',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle form submission
                    }
                  },
                  child: Text('Create Event'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
