import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_tomato_record_clone_coding/constant/common_size.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _phoneNumberController =
      TextEditingController(text: "010");

  final TextEditingController _codeController = TextEditingController();

  final inputBorder =
      const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey));

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  VerificationStatus _verificationStatus = VerificationStatus.none;

  final Duration _duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      Size size = MediaQuery.of(context).size;
      return Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '전화번호 로그인',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(common_padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    ExtendedImage.asset(
                      'assets/imgs/padlock.png',
                      width: size.width * 0.15,
                      height: size.width * 0.15,
                    ),
                    const SizedBox(width: common_padding),
                    Text(
                      '토마토마켓은 휴대폰 번호로 가입해요.\n번호는 안전하게 보관 되며\n어디에도 공개되지 않아요.',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                const SizedBox(height: common_sm_padding),
                TextFormField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    MaskedInputFormatter("000 0000 0000"),
                  ],
                  validator: (phoneNumber) {
                    if (phoneNumber != null && phoneNumber.length == 13) {
                      return null;
                    } else {
                      return '전화번호 똑바로 입력해주세요';
                    }
                  },
                  decoration: InputDecoration(
                      focusedBorder: inputBorder, border: inputBorder),
                ),
                const SizedBox(height: common_sm_padding),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState != null) {
                      bool passed = _formKey.currentState!.validate();
                      if (passed) {
                        setState(() {
                          _verificationStatus = VerificationStatus.codeSent;
                        });
                      }
                    }
                  },
                  child: const Text('인증문자 발송'),
                ),
                const SizedBox(height: common_padding),
                AnimatedOpacity(
                  opacity: 1dfa0,
                  duration: _duration,
                  child: AnimatedContainer(
                    height: getVerificationHeight(_verificationStatus),
                    duration: _duration,
                    child: TextFormField(
                      controller: _codeController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        MaskedInputFormatter("000000"),
                      ],
                      decoration: InputDecoration(
                          focusedBorder: inputBorder, border: inputBorder),
                    ),
                  ),
                ),
                AnimatedContainer(
                  height: getVerificationBtnHeight(_verificationStatus),
                  duration: _duration,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('인증문자 발송'),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  double getVerificationHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 60 + common_sm_padding;
    }
  }

  double getVerificationBtnHeight(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.none:
        return 0;
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 48;
    }
  }
}

enum VerificationStatus { none, codeSent, verifying, verificationDone }
