import 'package:dental/common/widgets/button/custom_button.dart';
import 'package:dental/features/auth/controller/auth_ctrl.dart';
import 'package:dental/utils/my_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dental/common/widgets/custom_input.dart';
import 'package:dental/localization/string_hardcoded.dart';
import 'package:dental/utils/ui_helper.dart';

class PwdResetView extends ConsumerWidget {
  const PwdResetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();
    return MyUI(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(title: Text('Input kode sandi baru'.hardcoded)),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formStateKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    20.height,
                    Text('Reset Kode Sandi'.hardcoded).tsHeadlineL(),
                    10.height,
                    Text('Silahkan masukkan kode sandi anda yang baru'.hardcoded).tsBodyM(),
                    40.height,
                    CustomInput(
                      onChanged: (val) => ref.read(textPasswordProvider.notifier).state = val,
                      hintText: 'Kode sandi baru'.hardcoded,
                      isPassword: true,
                      validator: (p0) => p0!.isEmpty
                          ? 'Kolom kode sandi harus di isi'.hardcoded
                          : p0.length < 5
                              ? 'Minimum 5 karakter'.hardcoded
                              : null,
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    20.height,
                    CustomInput(
                      onChanged: (val) => ref.read(textPasswordConfirmProvider.notifier).state = val,
                      hintText: 'Konfirmasi kode sandi baru'.hardcoded,
                      isPassword: true,
                      validator: (p0) => p0! != ref.read(textPasswordProvider)
                          ? 'Kolom ini harus sama dengan kolom kode sandi di atas'.hardcoded
                          : null,
                      prefixIcon: const Icon(Icons.lock_outline),
                    ),
                    40.height,
                    Center(
                      child: CustomButton(
                        // busy: state.isLoading,
                        width: double.infinity,
                        child: Text('Simpan'.hardcoded),
                        onPressed: () {
                          if (formStateKey.currentState!.validate() == false) {
                            return;
                          }
                          // Submit
                          ref.read(authCtrlProvider).resetPwd();
                        },
                      ),
                    ),
                    60.height,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
