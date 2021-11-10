import 'package:extended_image/extended_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_tomato_record_clone_coding/constant/common_size.dart';
import 'package:flutter_tomato_record_clone_coding/status/user_provider.dart';
import 'package:flutter_tomato_record_clone_coding/utils/logger.dart';
import 'package:provider/provider.dart';

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

  String? _verificationId;

  int? _forceResendToken;

  final Duration _duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      Size size = MediaQuery.of(context).size;
      return IgnorePointer(
        ignoring: _verificationStatus == VerificationStatus.verifying,
        child: Form(
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
                    onPressed: () async {
                      if (_verificationStatus ==
                          VerificationStatus.codeSending) {
                        return;
                      }
                      if (_formKey.currentState != null) {
                        bool passed = _formKey.currentState!.validate();
                        if (passed) {
                          String phoneNum = _phoneNumberController.text;
                          phoneNum = phoneNum.replaceAll(" ", "");
                          phoneNum = phoneNum.replaceFirst('0', '');
                          FirebaseAuth auth = FirebaseAuth.instance;
                          setState(() {
                            _verificationStatus =
                                VerificationStatus.codeSending;
                          });
                          await auth.verifyPhoneNumber(
                            phoneNumber: '+82$phoneNum',
                            forceResendingToken: _forceResendToken,
                            verificationCompleted:
                                (PhoneAuthCredential credential) async {
                              await auth.signInWithCredential(credential);
                            },
                            verificationFailed: (FirebaseAuthException error) {
                              logger.e(error.message);
                              setState(() {
                                _verificationStatus = VerificationStatus.none;
                              });
                            },
                            codeSent: (String verificationId,
                                int? forceResendingToken) async {
                              setState(() {
                                _verificationStatus =
                                    VerificationStatus.codeSent;
                              });
                              _verificationId = verificationId;
                              _forceResendToken = forceResendingToken;
                            },
                            codeAutoRetrievalTimeout:
                                (String verificationId) {},
                          );
                        }
                      }
                    },
                    child:
                        (_verificationStatus == VerificationStatus.codeSending)
                            ? const SizedBox(
                                height: 26,
                                width: 26,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text('인증문자 발송'),
                  ),
                  const SizedBox(height: common_padding),
                  AnimatedOpacity(
                    curve: Curves.easeInOut,
                    opacity: (_verificationStatus == VerificationStatus.none)
                        ? 0
                        : 1,
                    duration: _duration,
                    child: AnimatedContainer(
                      curve: Curves.easeInOut,
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
                    curve: Curves.easeInOut,
                    height: getVerificationBtnHeight(_verificationStatus),
                    duration: _duration,
                    child: TextButton(
                      onPressed: () {
                        attemptVerify();
                      },
                      child: _verificationStatus == VerificationStatus.verifying
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text('인증'),
                    ),
                  )
                ],
              ),
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
      case VerificationStatus.codeSending:
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
      case VerificationStatus.codeSending:
      case VerificationStatus.codeSent:
      case VerificationStatus.verifying:
      case VerificationStatus.verificationDone:
        return 48;
    }
  }

  void attemptVerify() async {
    setState(() {
      _verificationStatus = VerificationStatus.verifying;
    });
    await Future.delayed(const Duration(seconds: 1));
    String smsCode = '';

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId!, smsCode: _codeController.text);
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      logger.e('Verification Failed !!');
      SnackBar snackBar = const SnackBar(
        content: Text('입력하신 코드가 맞지 않습니다'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    setState(() {
      _verificationStatus = VerificationStatus.verificationDone;
    });
  }
}

enum VerificationStatus {
  none,
  codeSent,
  verifying,
  verificationDone,
  codeSending
}
