import 'package:flutter/material.dart';
import 'package:flutter_frontend_crud/Pages/LandingPage.dart';
import 'package:flutter_frontend_crud/services/VacationsServices.dart';

class FormCreate extends StatefulWidget {
  const FormCreate({Key? key}) : super(key: key);

  @override
  _FormCreateState createState() => _FormCreateState();
}

class _FormCreateState extends State<FormCreate> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Create Vacation"),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama Tempat Wisata"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Deskripsi Tempat Wisata"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Image URL Tempat Wisata"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: _imageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Lokasi Tempat Wisata"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: _cityController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Harga Tiket Tempat Wisata"),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> body = {
                        'name': _nameController.text,
                        'description': _descriptionController.text,
                        'image': _imageController.text,
                        'city': _cityController.text,
                        'price': _priceController.text,
                      };

                      await VacationsServices().createVacation(body).then((value) {
                        Navigator.pushReplacementNamed(context, LandingPage.url);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content:
                            Text('You have successfully create a vacation')));
                      });
                    },
                    child: Text("Create Vacation"),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
