import 'package:e301_web/config/router/router.dart';
import 'package:e301_web/providers/register_form_provider.dart';
import 'package:e301_web/ui/buttons/custom_outlined_button.dart';
import 'package:e301_web/ui/buttons/links_text.dart';
import 'package:e301_web/ui/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider = Provider.of<RegisterFormProvider>(
            context,
            listen: false,
          );

          return Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.black,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) => registerFormProvider.name = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'El nombre es obligatorio';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.supervised_user_circle_outlined,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged:
                            (value) => registerFormProvider.email = value,
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email no valido';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: 'email',
                          label: 'Correo Electrónico',
                          icon: Icons.email_outlined,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onChanged:
                            (value) => registerFormProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          if (value.length < 6) {
                            return 'La contraseña debe tener al menos 6 caracteres';
                          }
                          return null;
                        },
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
                          hint: '******',
                          label: 'Contraseña',
                          icon: Icons.lock_clock_outlined,
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomOutlinedButton(
                        onPressed: () {
                          registerFormProvider.validateForm();
                        },
                        text: 'Crear Cuenta',
                        isFilled: true,
                      ),
                      SizedBox(height: 20),
                      LinksText(
                        text: 'Ir al login',
                        onPressed: () {
                          Navigator.pushNamed(context, Flurorouter.loginRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
