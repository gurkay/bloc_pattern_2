part of 'login_view.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isCompleted) {
          Navigator.pushNamed(context, AppRoutes.PAGE_TWO);
        }
      },
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              // context.read<LoginBloc>().checkUser(
              //       _emailController.text,
              //       _passwordController.text,
              //     );

              context
                  .read<LoginBloc>()
                  .add(LoginEventIsLoading(isLoading: !state.isLoading));
              context.read<LoginBloc>().add(
                    LoginEventSubmitButton(
                      loginModel: LoginModel(
                        _emailController.text,
                        _passwordController.text,
                      ),
                    ),
                  );
            }
          },
          child: state.loginModel?.email == null
              ? const Text('Submit')
              : Text('Submit - ${state.loginModel?.email}'),
        );
      },
    );
  }
}

class EmailTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextFormField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        controller: controller,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'e-mail',
        ),
        validator: (value) {
          if (value!.isEmpty ||
              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'Enter correct email adress';
          } else {
            return null;
          }
        },
      ),
    );
  }
}

class PasswordTextFormField extends StatelessWidget {
  final TextEditingController controller;
  const PasswordTextFormField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.all(),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: controller,
            autofillHints: const [AutofillHints.password],
            keyboardType: TextInputType.visiblePassword,
            obscureText: state.isSecurePassword,
            obscuringCharacter: '*',
            decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                hintText: 'password',
                suffix: IconButton(
                  onPressed: () {
                    context.read<LoginBloc>().add(
                          LoginEventIsSecurePassword(
                            isSecurePassword: !state.isSecurePassword,
                          ),
                        );
                  },
                  icon: AnimatedCrossFade(
                    firstChild: const Icon(Icons.visibility_outlined),
                    secondChild: const Icon(Icons.visibility_off_outlined),
                    duration: const Duration(microseconds: 200),
                    crossFadeState: !state.isSecurePassword
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  ),
                )),
            validator: (value) {
              if (value!.isEmpty) {
                //||!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$').hasMatch(value)) {
                return 'Enter correct password adress';
              } else {
                return null;
              }
            },
          );
        },
      ),
    );
  }
}

class PagePadding extends EdgeInsets {
  PagePadding.all() : super.all(20);
}
