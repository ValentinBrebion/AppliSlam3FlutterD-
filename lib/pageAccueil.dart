import 'package:flutter/material.dart';

class PageAccueil extends StatefulWidget{
  const PageAccueil({super.key});

  @override
Widget build(BuildContext context){
  return Scaffold(
appBar: AppBar(title: const Text('Bienvenue ! vous êtes connecté !')),
body: LogerUser(),
  );
}
  State<PageAccueil> createState()  => _PageAccueil();

}


class _PageAccueil extends State<PageAccueil>
{

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LogerUser extends StatelessWidget{
  const LogerUser({super.key});

  Widget build(BuildContext context) {
    return Container();
  }
}