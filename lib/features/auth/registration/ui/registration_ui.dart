part of 'registration_page.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;

  RegistrationUI(this.registrationInteractor);

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    var s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Text(s.skip.toUpperCase()),
            textColor: theme.accentColor,
          ),
        ],
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
                  s.great_now_let_us,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText2!
                      .copyWith(color: theme.dividerColor),
                ),
              ),
              Spacer(),
              Container(
                height: size.width / 3,
                width: size.width / 3,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: theme.primaryColor,
                  size: 40,
                ),
              ),
              Spacer(),
              CustomTextField(
                controller: _nameController,
                hint: s.set_a_username,
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.center,
              ),
              Spacer(),
              CustomButton(
                onPressed: () => widget.registrationInteractor
                    .resister(_nameController.text),
              ),
              Spacer(flex: 10),
            ],
          ),
        ),
      ),
    );
  }
}
