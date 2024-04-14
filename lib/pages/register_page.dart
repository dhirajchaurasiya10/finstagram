import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceHeight, _deviceWidth;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  String? _name, _email, _password;
  File? _image;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth! * 0.05,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _titleWidget(),
              _profileImageWidget(),
              _registerForm(),
              _registerButtton(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget _titleWidget() {
    return Text(
      "Finstagram",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _registerForm() {
    return Container(
      height: _deviceHeight! * 0.30,
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _nameTextField(),
          _emailTextField(),
          _passwordTextField()
        ],
      )),
    );
  }

  Widget _profileImageWidget() {
    var _imageProvider = _image != null ? FileImage(_image!): NetworkImage("https://i.pravatar.cc/300");
    return GestureDetector(
      onTap: (){
        FilePicker.platform.pickFiles(type: FileType.image).then((_result) {
          setState(() {
            _image = File(_result!.files.first.path!);
          });
        });
      },
      child: Container(
        height: _deviceHeight!*0.15,
        width: _deviceWidth!*0.15,
        decoration: BoxDecoration(
          image: DecorationImage(image: _imageProvider as ImageProvider, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      decoration: InputDecoration(hintText: "Name.... "),
      validator: (_value) => _value!.length > 0 ? null : "Please enter a name",
      onSaved: (_value) {
        setState(() {
          _name=_value; 
        });
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email...",
      ),
    onSaved: (_value){
      setState(() {
        _email=_value;
      });
    },
    validator: (_value) {
        bool _result = _value!.contains(
          RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
        );
        return _result ? null : "Please enter a valid email";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Password...",
      ),
    onSaved: (value){
      setState(() {
        _password=value;
      });
    },
    validator: (_value) => _value!.length>6 ? null : "Please enter password greater than 6 characters",
    );
  }

  Widget _registerButtton() {
    return MaterialButton(
      onPressed: () {},
      minWidth: _deviceWidth! * 0.5,
      height: _deviceHeight! * 0.05,
      color: Colors.red,
      child: Text(
        "Register",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
