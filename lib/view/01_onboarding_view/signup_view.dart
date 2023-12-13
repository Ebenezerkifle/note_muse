import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_muse/app/routes.gr.dart';
import 'package:note_muse/providers/auth_provider.dart';
import 'package:note_muse/view/common/app_colors.dart';
import 'package:note_muse/view/common/app_text_style.dart';
import 'package:note_muse/view/widgets/custome_button.dart';
import 'package:note_muse/view/widgets/input_field.dart';

enum FormData {
  email,
  phone,
  password,
  confirmPass,
}

@RoutePage()
class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  Color enabled = const Color.fromARGB(255, 63, 56, 89);
  Color enabledtxt = Colors.white;
  Color disabled = Colors.grey;
  Color backgroundColor = AppColors.background;
  bool ispasswordev = true;
  bool isConfPassword = true;
  FormData? selected;

  final _formKey = GlobalKey<FormState>();
  late bool error = false;
  Map<dynamic, String> errorMsg = {};

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  onSubmit() async {
    var authProvider = ref.watch(AuthProvider.provider.notifier);
    // calling a method to register new user.
    if (_formKey.currentState!.validate() && errorMsg.isEmpty) {
      showSnackBar('a moment Please...');
      bool valid = await authProvider.registerNewUser(
        emailController.text,
        passwordController.text,
        phoneNumController.text,
      );
      if (valid) {
        showSnackBar("Successfully Registered!");
        pushToSignInPage();
      }
    }
  }

  pushToSignInPage(){
    context.pushRoute(const SignInRoute());
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
                        "SignUp",
                        style: AppTextStyle.withColor(
                          color: AppColors.primary,
                          style: AppTextStyle.h1Bold,
                        ),
                      ),
                      Text("Please fill valid informations",
                          style: AppTextStyle.withColor(
                            color: AppColors.primary,
                            style: AppTextStyle.h4Normal,
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        controller: phoneNumController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            errorMsg[phoneNumController] =
                                "Please enter your username";
                            setState(() {});
                            return null;
                          }
                          errorMsg.remove(phoneNumController);
                          setState(() {});
                          return null;
                        },
                        hint: 'Userame',
                        error: errorMsg.containsKey(phoneNumController),
                        onTap: () {
                          setState(() {
                            selected = FormData.phone;
                          });
                        },
                        inputType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.contact_page,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        width: MediaQuery.of(context).size.width * .85,
                        stroke: true,
                      ),
                      const SizedBox(height: 10),
                      InputField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            errorMsg[emailController] =
                                'Please enter your email';
                            setState(() {});
                            return null;
                          }
                          // todo add Regex notation for an email validation.
                          errorMsg.remove(emailController);
                          setState(() {});
                          return null;
                        },
                        error: errorMsg.containsKey(emailController),
                        hint: 'Email',
                        onTap: () {
                          setState(() {
                            selected = FormData.email;
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
                          } else if (value.length < 6) {
                            errorMsg[passwordController] =
                                'password length must be > 6';
                            setState(() {});
                            return null;
                          }
                          errorMsg.remove(passwordController);
                          setState(() {});
                          return null;
                        },
                        error: errorMsg.containsKey(passwordController),
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
                      const SizedBox(height: 10),
                      InputField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            errorMsg[confirmPassController] =
                                'Please confirm your password';
                            setState(() {});
                            return null;
                          }
                          if (value.toString() != passwordController.text) {
                            errorMsg[confirmPassController] =
                                'Password Mismatch occured';
                            setState(() {});
                            return null;
                          }
                          errorMsg.remove(confirmPassController);
                          setState(() {});
                          return null;
                        },
                        error: errorMsg.containsKey(confirmPassController),
                        width: MediaQuery.of(context).size.width * .85,
                        controller: confirmPassController,
                        hint: 'Confirm password',
                        onTap: () {
                          setState(() {
                            selected = FormData.confirmPass;
                          });
                        },
                        prefixIcon: const Icon(
                          Icons.lock_open_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        hideText: isConfPassword,
                        suffixIcon: IconButton(
                          icon: isConfPassword
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
                              setState(() => isConfPassword = !isConfPassword),
                        ),
                        stroke: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      (authState.error != "" && !authState.sucess) ||
                              (errorMsg.isNotEmpty)
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
                      const SizedBox(height: 10),
                      CustomeButton(
                        text: 'Proceed',
                        textStyle: AppTextStyle.withColor(
                          color: Colors.white,
                          style: AppTextStyle.h3Bold,
                        ),
                        height: 50,
                        round: true,
                        loading: authState.loading,
                        width: MediaQuery.of(context).size.width * .85,
                        onTap: onSubmit,
                      ),
                      const SizedBox(height: 15),
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
