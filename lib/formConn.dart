// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'pageAccueil.dart';

class formConn extends StatelessWidget {
  const formConn({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp( home : Scaffold(
      appBar: AppBar(title: Text("Formulaire de connexion")),
      
      body:const FormConnexion(),
      
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
 String valogin = "val";
 String valPass = "valou";
  String msgLogin = "";
  String msgPass = "";


bool connexionUser(String msgLogin,String msgPass){
  if(msgLogin == valogin && msgPass == valPass){
return true;

  }else{
    return false;
  }
  return false;
}


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
                onChanged: (value) { 
                    msgLogin = value;
                    }
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
              TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                   prefixIcon: const Icon(Icons.lock),
                   suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    
                    )),
                
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre mot de passe';
                  }
                    // retourner la valeur dans une variable
                },
                onChanged: (value) { 
                    msgPass = value;
                    }
                ),
              
             const  Padding(padding: EdgeInsets.only(top:20)),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                       ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Traitement en cours"))
                        
                       );
                       if(connexionUser(msgLogin,msgPass)){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const PageAccueil()), );
                       }else{
                
                       }
                       
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