part of 'login_page.dart';

class CustomCountryCodePicker extends StatelessWidget {
  final TextEditingController _controller;
  final ValueChanged<CountryCode>? onChanged;

  CustomCountryCodePicker(this._controller, this.onChanged);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CustomTextField(
          controller: _controller,
          hint: S.of(context).select_country,
          readOnly: true,
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          child: CountryCodePicker(
            alignLeft: true,
            padding: EdgeInsets.zero,
            onChanged: onChanged,
            dialogBackgroundColor: theme.scaffoldBackgroundColor,
            dialogSize: Size(size.width * 0.8, size.height * 0.8),
            initialSelection: '+1',
            hideMainText: true,
            searchDecoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor),
              ),
              prefixIcon: Icon(Icons.search, color: theme.primaryColor),
            ),
            closeIcon: Icon(Icons.close, color: theme.primaryColor),
            showFlag: false,
            showFlagDialog: true,
            favorite: ['+91', 'US'],
          ),
        ),
      ],
    );
  }
}
