import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/widgets/auth/auth_button.dart';
import 'package:intl/intl.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  Map<String, String> _registerData = {
    'email': '',
    'password': '',
    'name': '',
    'address': '',
    'phone': '',
  };

  final passwordController = TextEditingController();

  List<String> games = const ['Handball', 'Football', 'Swimming', 'Tennis', 'Other'];
  List<String> goals = const [
    'Rehabilitation',
    'Injuries Recovery',
    'Getting Lean',
    'Bulking',
    'Other',
  ];

  String? _selectedGame;
  String? _selectedGoal;
  DateTime? _birthDate;

  void _errorSnackBar([String? errorMessage]) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage ?? 'Something went wrong! Please try again.'),
      ),
    );
  }

  void _registerTheUser() async {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    if (_birthDate == null) {
      _errorSnackBar('Please Enter your birth date');
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    try {
      final userCred = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerData['email']!, password: _registerData['password']!);
      await FirebaseFirestore.instance.collection('trainee').doc(userCred.user!.uid).set({
        'name': _registerData['name'],
        'email': _registerData['email'],
        'birthDate': _birthDate!.toIso8601String(),
        'phone': _registerData['phone'],
        'address': _registerData['address'],
        'selectedGame': _selectedGame,
        'selectedGoal': _selectedGoal,
      });

      Navigator.of(context).pop();
    } on FirebaseAuthException catch (error) {
      _errorSnackBar(error.message);
      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      _errorSnackBar();
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _startShowingDatePicker() async {
    try {
      final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      setState(() {
        _birthDate = selectedDate;
      });
    } catch (error) {
      return;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                labelText: 'Name',
                contentPadding: EdgeInsets.only(left: 15),
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Please Enter Your Name';
                return null;
              },
              onSaved: (value) {
                _registerData['name'] = value!;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                contentPadding: EdgeInsets.only(left: 15),
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Please Enter Your Email';
                if (!value.contains('@') || !value.contains('.')) {
                  return 'Please Enter A Valid Email';
                }
                return null;
              },
              onSaved: (value) {
                _registerData['email'] = value!.trim();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                contentPadding: EdgeInsets.only(left: 15),
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Please Enter A Password';
                if (value.length < 6) {
                  return 'Password is too short. Enter a stronger one that contains more than 6 '
                      'characters';
                }
                return null;
              },
              onSaved: (value) {
                _registerData['password'] = value!;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                contentPadding: EdgeInsets.only(left: 15),
              ),
              validator: (value) {
                if (passwordController.text != value) return 'Password didn\'t match';
                return null;
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Mobile No.',
                contentPadding: EdgeInsets.only(left: 15),
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Please Enter Your Phone Number';
                if (value.length < 8) return 'Please Enter A Valid Phone Number';
                return null;
              },
              onSaved: (value) {
                _registerData['phone'] = value!.trim();
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 130,
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedGame,
                    hint: const FittedBox(child: Text('Chose Game')),
                    isExpanded: true,
                    items: <DropdownMenuItem>[
                      ...games
                          .map((game) => DropdownMenuItem(value: game, child: Text(game)))
                          .toList()
                    ],
                    decoration: const InputDecoration(contentPadding: EdgeInsets.only(left: 15)),
                    onChanged: (value) {
                      setState(() {
                        _selectedGame = value.toString();
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please Enter Your Game';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _selectedGame = value;
                    },
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButtonFormField<dynamic>(
                    value: _selectedGoal,
                    hint: const Text('Chose your Goal'),
                    isExpanded: true,
                    items: <DropdownMenuItem>[
                      ...goals
                          .map((goal) => DropdownMenuItem(value: goal, child: Text(goal)))
                          .toList()
                    ],
                    decoration: const InputDecoration(contentPadding: EdgeInsets.only(left: 15)),
                    onChanged: (value) {
                      setState(() {
                        _selectedGoal = value.toString();
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Please Enter Your Goal';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _selectedGoal = value;
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(_birthDate == null
                          ? 'Chose Birth Date'
                          : DateFormat.yMd().format(_birthDate!)),
                    ),
                  ),
                  const Spacer(),
                  IconButton(onPressed: _startShowingDatePicker, icon: const Icon(Icons.date_range))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.streetAddress,
              decoration: const InputDecoration(
                labelText: 'Address',
                contentPadding: EdgeInsets.only(left: 15),
              ),
              validator: (value) {
                if (value!.isEmpty) return 'Please Enter Your Address';
                return null;
              },
              onSaved: (value) {
                _registerData['address'] = value!.trim();
              },
            ),
            const SizedBox(
              height: 50,
            ),
            _isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : AuthButton(onPressed: () => _registerTheUser(), title: 'Register')
          ],
        )),
      ),
    );
  }
}
