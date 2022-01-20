part of 'login_page.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  String? isoCode = "US";

  @override
  void initState() {
    super.initState();
    _showLanguageSheet();
  }

  _showLanguageSheet() {
    Future.delayed(
      Duration(milliseconds: 100),
      () => Sheet.open(context, LanguageSheet()),
    );
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.all(30.0),
          height: size.height,
          child: Column(
            children: [
              Spacer(),
              Center(child: Image.asset(Assets.appLogo)),
              Spacer(),
              CustomCountryCodePicker(
                _countryController,
                (value) {
                  isoCode = value.code;
                  _countryController.text = value.name as String;
                },
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: _numberController,
                hint: S.of(context).enter_phone_number,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  widget.loginInteractor.loginWithMobile(
                    isoCode!,
                    _numberController.text,
                  );
                },
              ),
              Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}
