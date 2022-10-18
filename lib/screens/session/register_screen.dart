import 'package:flutter/material.dart';
import 'package:mi_proyecto/providers/postulant_providers/register_postulant_provider.dart';
import 'package:provider/provider.dart';

import '../../providers/postulant_providers/security/auth_postulant.dart';
import '../../ui/input_decoration.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView
      (
        child: Column(
          children: [
            ChangeNotifierProvider(
              create: ( _ ) => RegisterFormProvider(),
              child: _RegisterForm(),
            )
          ]
        )
      )
    );
  }
}

 class _RegisterForm extends StatelessWidget {
   
   @override
   Widget build(BuildContext context) {
     final registerForm = Provider.of<RegisterFormProvider>(context);
     final user = Provider.of<AuthPostulantService>(context);

     return Form(
      key: registerForm.formKey,
       autovalidateMode: AutovalidateMode.onUserInteraction,
       child: Container(
         margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
         child: Column(
           children: [
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: 'John',
                   labelText: 'Nombre',
                 ),
                 onChanged: ( value ) {
                  registerForm.firstName;
                  registerForm.id = user.postulant.id;
                  }
             ),
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: 'Doe',
                   labelText: 'Apellido',
                 ),
                 onChanged: ( value ) => registerForm.lastName,
             ),
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: '987654321',
                   labelText: 'Número telefónico',
                 ),
                 onChanged: ( value ) => registerForm.phoneNumber,
             ),
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: 'Esta foto será tu perfil',
                   labelText: 'Foto de perfil',
                 ),
                 onChanged: ( value ) => registerForm.profilePicture,
             ),
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: 'Esta foto será tu portada',
                   labelText: 'Foto de portada',
                 ),
                 onChanged: ( value ) => registerForm.bannerPicture,
             ),
             DropdownButtonFormField<String>(
               decoration: InputDecorations.authInputDecoration(hintText: 'Empleador', labelText: 'Rol'),
               items: [
                 DropdownMenuItem(value: 'empleador', child: Text('Empleador')),
                 DropdownMenuItem(value: 'postulante', child: Text('Postulante')),
               ],
               onChanged: ( value ) {
                 if (value == 'empleador') registerForm.roleId = 1;
                 else registerForm.roleId = 2;
               },
             ),
             SizedBox(height: 50),
             SizedBox(
                 width: 350,
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: Colors.indigo,
                   ),
                   child: Text(
                     'Registrarse',
                     style: TextStyle(
                       color: Colors.white
                     ),
                     ),
                   onPressed: () async {
                     user.updatePostulant(user.postulant);
                   },
                 ),
               )
           ],
         ),
       ),
     );
   }
 }