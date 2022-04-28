import 'package:flutter/material.dart';
import 'package:skin_scan/register_feature/create_account.dart';
import 'package:skin_scan/register_feature/create_account.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: createAccount(),
    );
  }
}
