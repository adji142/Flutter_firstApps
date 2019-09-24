import 'package:flutter/material.dart';
import 'package:newapp/globalvar.dart' as globalvar;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginState();
}

enum FormMode { LOGIN, SIGNUP }

class _LoginState extends State<LoginPage> {
  // bool _isLoading = false;
  final _formKey = new GlobalKey<FormState>();
  FormMode _formMode = FormMode.LOGIN;
  bool _isLoading = false;
  
  @override
  Widget build(BuildContext context){
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      body: Stack(
        children: <Widget>[
          _showBody(),
          _showCircularProgress(),
        ],
      )
    );
  }
  Widget _showBody(){
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
        key: _formKey,
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            _showLogo(),
            _showEmailInput(),
            _showPasswordInput(),
            _showPrimaryButon(),
            // _showSecondaryButton(),
            // _showMessage(),
          ],
        ),
      ),
    );
  }
  Widget _showLogo(){
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('images/flutter-icon.png'),
        ),
      ),
    );
  }
  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      ),
    );
  }
  Widget _showPasswordInput(){
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Password',
          icon: new Icon(
            Icons.lock,
            color: Colors.grey
          )
        ),
      ),
    );
  }
  Widget _showPrimaryButon(){
    return new Padding(
      padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
      child: SizedBox(
        height: 40.0,
        child: new RaisedButton(
          elevation: 5.0,
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          color: Colors.blue,
          child: _formMode == FormMode.LOGIN
            ? new Text("Login",
              style: new TextStyle(fontSize: 20,color: Colors.white)) :
              new Text("Login",
              style: new TextStyle(fontSize: 20,color: Colors.white)), 
              onPressed: () => _ackAlert(context)
        ),
      ),
    );
  }
    Widget _showCircularProgress(){
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } return Container(height: 0.0, width: 0.0,);

  }

}
Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(globalvar.uriUrl),
        content: const Text('This item is no longer available'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
