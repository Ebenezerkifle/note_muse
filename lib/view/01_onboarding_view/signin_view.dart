
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_muse/app/routes.gr.dart';
import 'package:note_muse/providers/auth_provider.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';
import 'package:note_muse/view/widgets/custome_button.dart';
import 'package:note_muse/view/widgets/input_field.dart';

enum FormData {
  phone,
  password,
}

@RoutePage()
class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color disabled = Colors.grey;
  Color backgroundColor = AppColors.background;
  bool ispasswordev = true;
  FormData? selected;
  Map<dynamic, String> errorMsg = {};

  final _formKey = GlobalKey<FormState>();
  late bool error = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onSubmit() async {
    var authProvider = ref.watch(AuthProvider.provider.notifier);
    var authState = ref.watch(AuthProvider.provider);
    // check if the given input is validated
    if (_formKey.currentState!.validate() && errorMsg.isEmpty) {
      showSnackBar('a moment Please...');
      //send the given inputs to the backend for validation
      bool valid = await authProvider.signIn(
          emailController.text, passwordController.text);
      //handle the response
      if (valid) {
        showSnackBar(authState.error);
        pushToHomePage();
      }
    }
    //if not validated show an error
  }


  pushToHomePage() {
    context.router.replaceAll([const HomeRoute()]);
  }

  showSnackBar(String msg) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(msg),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var authState = ref.watch(AuthProvider.provider);
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Welcome to NoteMuse",
                        style: AppTextStyle.withColor(
                          color: AppColors.primary,
                          style: AppTextStyle.h1Bold,
                        ),
                      ),
                      Text("Please sign in to continue",
                          style: AppTextStyle.withColor(
                            color: AppColors.primary,
                            style: AppTextStyle.h4Normal,
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            errorMsg[emailController] =
                                'The email can not be empty';
                            setState(() {});
                            return null;
                          }
                          errorMsg.remove(emailController);
                          setState(() {});
                          return null;
                        },
                        error: errorMsg.containsKey(emailController),
                        hint: 'Email',
                        onTap: () {
                          setState(() {
                            selected = FormData.phone;
                          });
                        },
                        inputType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.email,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        width: MediaQuery.of(context).size.width * .85,
                        stroke: true,
                      ),
                      const SizedBox(height: 10),
                      InputField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            errorMsg[passwordController] =
                                'Please enter your password';
                            setState(() {});
                            return null;
                          }
                          errorMsg.remove(passwordController);
                          setState(() {});
                          return null;
                        },
                        width: MediaQuery.of(context).size.width * .85,
                        controller: passwordController,
                        hint: 'Password',
                        onTap: () {
                          setState(() {
                            selected = FormData.password;
                          });
                        },
                        prefixIcon: const Icon(
                          Icons.lock_open_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        hideText: ispasswordev,
                        error: errorMsg.containsKey(passwordController),
                        suffixIcon: IconButton(
                          icon: ispasswordev
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: AppColors.primary,
                                  size: 20,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: AppColors.primary,
                                  size: 20,
                                ),
                          onPressed: () =>
                              setState(() => ispasswordev = !ispasswordev),
                        ),
                        stroke: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      (errorMsg.isNotEmpty) ||
                              (authState.error != "" && !authState.sucess)
                          ? Text(
                              errorMsg.isNotEmpty
                                  ? errorMsg.entries.first.value
                                  : authState.error,
                              style: AppTextStyle.withColor(
                                color: AppColors.danger,
                                style: AppTextStyle.h4Normal,
                              ),
                            )
                          : Container(),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomeButton(
                        text: 'Login',
                        textStyle: AppTextStyle.withColor(
                          color: Colors.white,
                          style: AppTextStyle.h3Bold,
                        ),
                        height: 50,
                        round: true,
                        loading: authState.loading,
                        width: MediaQuery.of(context).size.width * .85,
                        onTap: onSubmit, //onProceed,//
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: AppTextStyle.h4Normal,
                          ),
                          InkWell(
                              onTap: () =>
                                  context.pushRoute(const SignUpRoute()),
                              child: const Text(
                                "Register",
                                style: AppTextStyle.h3Bold,
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
