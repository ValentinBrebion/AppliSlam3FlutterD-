import 'package:flutter/material.dart';

class formConn extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulaire de connexion")),
      
      body:FormConnexion(),
      
      drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
          
            'Gestion des utilisateurs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        ListTile(
          leading: Icon(Icons.mode_edit),
          title: Text('Inscription'),
        ),
        ListTile(
          leading: Icon(Icons.pending),
          title: Text('changement de mot de passe'),
        ),
        
      ],
    ),
  ),
    );
  }
}


class FormConnexion extends StatefulWidget {
  const FormConnexion({super.key});

  @override
  State<FormConnexion> createState() => _FormConnexion();
}



class _FormConnexion extends State<FormConnexion> {

  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
Widget build(BuildContext context) {
    return Card(
          child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Adresse email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre adresse email';
                  }
                    // retourner la valeur dans une variable
                },
              ),
              Padding(padding: EdgeInsets.only(top: 25)),
              TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                   prefixIcon: Icon(Icons.lock),
                   suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    })),
                
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                    // retourner la valeur dans une variable
                }
                ),
              
             const  Padding(padding: EdgeInsets.only(top:20)),
              Center(child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                       ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Traitement en cours"))
                       );
                    }
                  },
                  child: const Text('Connexion'),
                ),
              ),
          
            ],
            ),
          ),
    );
    


}
}