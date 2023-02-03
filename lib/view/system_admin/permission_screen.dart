import 'package:flutter/material.dart';

class PermissionScreen extends StatefulWidget {
  const PermissionScreen({super.key});

  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  final _formKey = GlobalKey<FormState>();
  // final _user = User();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.fromLTRB(64, 32, 64, 64),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Builder(
                      builder: (context) => Form(
                          key: _formKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  style: const TextStyle(
                                    fontFamily: 'HelveticaNeue',
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'First name',
                                    labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'HelveticaNeue',
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your first name';
                                    }
                                  },
                                  // onSaved: (val) =>
                                  //     setState(() => _user.firstName = val),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Last name',
                                    labelStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'HelveticaNeue',
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter your last name.';
                                    }
                                  },
                                  // onSaved: (val) =>
                                  //     setState(() => _user.lastName = val),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 50, 0, 20),
                                  child: const Text(
                                    'Subscribe',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'HelveticaNeue',
                                    ),
                                  ),
                                ),
                                SwitchListTile(
                                    title: const Text(
                                      'To our Monthly Subscription',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'HelveticaNeue',
                                      ),
                                    ),
                                    value: true,
                                    onChanged: (bool val) {}),
                                SwitchListTile(
                                    title: const Text(
                                      'To our Yearly Subscription',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    value: true,
                                    onChanged: (bool val) {}),
                                SwitchListTile(
                                    title: const Text(
                                      'To our Weekly Subscription',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    value: true,
                                    onChanged: (bool val) {}),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 50, 0, 20),
                                  child: const Text(
                                    'Interests',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                CheckboxListTile(
                                    title: const Text(
                                      'Writing',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    value: true,
                                    onChanged: (val) {
                                      // setState(() => _user
                                      //     .passions[User.PassionWriting] = val);
                                    }),
                                CheckboxListTile(
                                    title: const Text(
                                      'Singing',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontFamily: 'HelveticaNeue',
                                      ),
                                    ),
                                    value: true,
                                    onChanged: (val) {
                                      // setState(() => _user
                                      //     .passions[User.PassionSinging] = val);
                                    }),
                                CheckboxListTile(
                                    title: const Text(
                                      'Travelling',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    value: true,
                                    onChanged: (val) {
                                      // setState(() => _user
                                      //     .passions[User.PassionTraveling] = val);
                                    }),
                                CheckboxListTile(
                                    title: const Text(
                                      'Cooking',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    value: true,
                                    onChanged: (val) {
                                      // setState(() => _user
                                      //     .passions[User.PassionCooking] = val);
                                    }),
                                Container(
                                    height: 80,
                                    // margin: EdgeInsets.only(left: 200, right: 200),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0, horizontal: 16.0),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          // if (_formKey.currentState.validate()) {
                                          //   _formKey.currentState.save();
                                          //   _user.save();
                                          //   _showDialog(context);
                                          //   print(_user);
                                          //   print(_user.firstName);
                                          // }
                                        },
                                        child: const Text(
                                          'Save',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'HelveticaNeue',
                                          ),
                                        ))),
                              ])))),
            ),
          ),
        ),
      ),
    );
  }
}
