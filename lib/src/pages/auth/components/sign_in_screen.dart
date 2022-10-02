import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'custom_text_field.dart';

import '../../../../commons/resources/translation.dart';
import '../../../config/custom_colors.dart';
import '../../base/base_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // para limitar o tamanho da chamando no sizedeBox de do Scaffold
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              // SingleChildScrollView cria um scrollview na tela completa.
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Nome do App
                    _nameApp(context),
                    //Animação do App
                    _animationTextApp(),
                  ],
                ),
              ),
            ),

            //Formulario

            _form(context),
          ],
        ),
      ),
    );
  }

  Text _nameApp(context) => Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: 40,
          ),
          children: [
            TextSpan(
              text: Translation.of(context).loginTitle01,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

// animation text app
  SizedBox _animationTextApp() => SizedBox(
        height: 25,
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
          child: AnimatedTextKit(
            pause: Duration.zero,
            repeatForever: true,
            animatedTexts: [
              FadeAnimatedText('Rosas'),
              FadeAnimatedText('Girasol'),
              FadeAnimatedText('Avenca'),
              FadeAnimatedText('Dália'),
              FadeAnimatedText('Ficus'),
            ],
          ),
        ),
      );

// formulário
  Container _form(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 40,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(45),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // // Email
            _email(),
            // Senha
            _password(),

// button

            _button(context),

            // Esqueceu a senha
            _forgotPassword(),

            //Divisor
            _divisor(),

            // botão criar conta

            _createAccount(),
          ],
        ),
      );

  //email
  CustomTextField _email() => const CustomTextField(
        icon: Icons.email,
        label: 'Email',
      );

  // password
  CustomTextField _password() => const CustomTextField(
        icon: Icons.lock,
        label: 'Senha',
        isSecret: true,
      );

// Divisor
  Padding _divisor() => Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey.withAlpha(90),
                thickness: 2,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Text('Ou'),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey.withAlpha(90),
                thickness: 2,
              ),
            ),
          ],
        ),
      );

// create Account
  SizedBox _createAccount() => SizedBox(
        height: 50,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            side: const BorderSide(
              width: 2,
              color: Colors.green,
            ),
          ),
          onPressed: () {},
          child: const Text(
            'Criar conta',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );

  // ESQUECEU A SENHA

  Align _forgotPassword() => Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Esqueceu a senha?',
            style: TextStyle(
              color: CustomColors.customContrastColor,
            ),
          ),
        ),
      );

// BUTTON
  SizedBox _button(BuildContext context) => SizedBox(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onPressed: () => onSubmit(context),
          child: const Text(
            'Entrar',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      );

  void onSubmit(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return BaseScreen();
        },
      ),
    );
  }
}
