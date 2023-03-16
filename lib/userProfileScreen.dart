

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'UserData.dart';
import 'country.dart';
import 'gender.dart';

class Register extends StatefulWidget {

  String userPhone = "";
  String userCountryCode = "";

  Register({required this.userPhone, required this.userCountryCode,Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        appBar:   AppBar(
          title:   const Text("Please enter your Details"),
        ),
        body:   Center(
            child:   ListView(children: [
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: UserProfile(widget.userPhone,widget.userCountryCode))
            ])));
  }
}



class UserProfile extends StatefulWidget {
  final UserData _uData = UserData.empty();
  UserProfile(String userPhone, String userCountryCode, {super.key})  {
    _uData.phone= userPhone;
    _uData.countryCode = userCountryCode;
  }
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  UserData d = UserData.empty();
  final DateFormat _dateFormat = DateFormat("dd-MM-yyyy");
  final _formKey = GlobalKey<FormState>();
  String _country = CountryList.country_menu_items[0].value!;
  String _sex = Gender.values.toString();
  TextEditingController? _nameTextController;
  TextEditingController? _emailTextController;
  TextEditingController? _dobTextController;

  _UserProfileState()
  {
    _nameTextController = TextEditingController(text: d.name);
    _emailTextController = TextEditingController(text: d.email);
    _dobTextController = TextEditingController(text: _dateFormat.format(d.dob!));
  }

  void _handleSexRadioChanged(String value) {
    setState(() {
      _sex = value;
    });
  }

  TextFormField createNameWidget() {
    return TextFormField(
      validator: (value) {
        if (value == null) {
          return 'Please enter your name.';
        }
        return null;
      },
      decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Full name',
          labelText: 'Enter your full name'),
      controller: _nameTextController,
      autofocus: true,
    );
  }

  TextFormField createEmailWidget() {
    return TextFormField(
      validator: (value) =>
      EmailValidator.validate(value ?? "")
          ? null
          : "Please enter a valid email",
      decoration: const InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'Email',
          labelText: 'Enter your email'),
      controller: _emailTextController,
      autofocus: true,
    );
  }

  InputDecorator createSexWidget() {
    List<Widget> radioWidgets = [
      const Text("Male"),
      Radio(
          value: "Male",
          groupValue: _sex,
          onChanged: (s) => _handleSexRadioChanged(s!)
      ),
      const Text("Female"),
      Radio(
          value: "Female",
          groupValue: _sex,
          onChanged: (s) => _handleSexRadioChanged(s!)
      ),
    ];
    return InputDecorator(
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Gender of you',
          labelText: 'Sex',
        ),
        child: DropdownButtonHideUnderline(
            child: Row(children: radioWidgets)));
  }

  DateTimeField createDobWidget() {
    return DateTimeField(
      validator: (value) {
        if ((value == null)) {
          return 'Please enter your date of birth.';
        }
        return null;
      },
      format: _dateFormat,
      decoration: const InputDecoration(
          icon: Icon(Icons.date_range),
          hintText: 'Date',
          labelText: 'Select the Date'),
      controller: _dobTextController,
      onShowPicker: (ctx, dValue) {
        return showDatePicker(
            context: ctx,
            firstDate: DateTime(1900),
            initialDate: DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }


  InputDecorator createCountryWidget() {
    DropdownButton<String> countryDropdownButton = DropdownButton<String>(
        items: CountryList.country_menu_items,
        value: _country,
        isDense: true,
        onChanged: (value) {
          setState(() {
            _country = value!;
          });
        });
    return InputDecorator(
        decoration: const InputDecoration(
          icon: Icon(Icons.location_city),
          hintText: 'Select the Country',
          labelText: 'Select the Country',
        ),
        child: DropdownButtonHideUnderline(child: countryDropdownButton));
  }

  @override
  void dispose() {
    _nameTextController!.dispose();
    _emailTextController!.dispose();
    _dobTextController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> formWidgetList = <Widget>[];
    formWidgetList.add(createNameWidget());
    formWidgetList.add(createEmailWidget());
    formWidgetList.add(createSexWidget());
    formWidgetList.add(createDobWidget());
    formWidgetList.add(createCountryWidget());

    formWidgetList.add(ElevatedButton(
      onPressed: () {
        if (_formKey.currentState?.validate() == true) {
          widget._uData.name = _nameTextController!.text;
          widget._uData.email = _emailTextController!.text;
          DateFormat f = DateFormat("dd-MM-yyyy");
          widget._uData.dob = f.parse(_dobTextController!.text);
          widget._uData.sex = Gender.values.byName(_sex);
          widget._uData.country = _country;
        }
      },
      child:   const Text('Save'),
    ));

    return Form(key: _formKey, child: Column(children: formWidgetList));
}
}