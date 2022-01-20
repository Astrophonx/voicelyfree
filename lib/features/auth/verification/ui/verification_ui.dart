part of 'verification_page.dart';

class VerificationUI extends StatefulWidget {
  final VerificationInteractor verificationInteractor;

  VerificationUI(this.verificationInteractor);

  @override
  _VerificationUIState createState() => _VerificationUIState();
}

class _VerificationUIState extends State<VerificationUI> {
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    var s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          s.verification.toUpperCase(),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(30.0),
          height: Helper.getContainerHeight(context),
          child: Column(
            children: [
              Spacer(),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width * 0.56),
                child: Text(
                  s.enter_verification_code,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: theme.dividerColor),
                ),
              ),
              Spacer(flex: 2),
              CustomTextField(
                hint: s.enter_code_here,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 30),
              CustomButton(
                onPressed: () => widget.verificationInteractor.verify(),
              ),
              SizedBox(height: 30),
              Text(
                s.did_not_receive_it,
                style: theme.textTheme.bodyText2!.copyWith(
                  color: theme.dividerColor,
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(s.resend.toUpperCase()),
                textColor: theme.primaryColor,
              ),
              Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}
