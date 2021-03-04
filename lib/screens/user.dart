import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../blocs/user/user_bloc.dart';
import '../blocs/user/user_event.dart';
import '../blocs/user/user_state.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();

    _textEditingController =
        TextEditingController(text: UserState(null).username);
    // _userBloc.sendEvent.add(GetUsernameEvent());
  }

  @override
  void dispose() {
    // _userBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final UserBloc _userBloc = BlocProvider.of<UserBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<UserBloc, UserState>(
          builder: (_, state) {
            return Text('User - ${state.username}');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
          autofocus: false,
          controller: _textEditingController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            helperText: 'Guest by default',
            labelText: 'User Name',
          ),
          onChanged: (value) {
            _userBloc.add(OnChangeEvent(value));
          },
        ),
      ),
    );
  }
}
