import 'package:flutter/material.dart';
import 'package:flutter_front/models/user.dart';
import 'package:flutter_front/views/route_list_page.dart';
import '../services/userServices.dart';



class FormLoginWidget extends StatefulWidget {
  const FormLoginWidget({super.key});

  @override
  State<FormLoginWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<FormLoginWidget> {
  // String nameValue = '';
  // String passwordValue = '';
  // String emailValue = '';

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();



  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Permet accedir al form desde qualseevol lloc

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.email),
            title: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
              ),
              controller: emailController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your password',
              ),
              controller: passwordController,

              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          TextButton(onPressed: (){
            setState (() async { //aquí dona error
              String formEmail = emailController.text.toString();
              print(formEmail);

              String formPassword = passwordController.text.toString();
              print(formPassword);

              var user = User(name: "", id: "", password: formPassword, email: formEmail, admin: false);
              await UserServices().createUser(user);
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RouteListPage())
              );
            });
            

          }, child: Text ('Submit')),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 16.0),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // Validate will return true if the form is valid, or false if
          //       // the form is invalid.
          //       if (_formKey.currentState!.validate()) {
          //         // Process data.
          //       }
          //     },
          //     child: const Text('Submit'),
          //   ),
          // ),
        ],
      ),
          

    );
  }
}
