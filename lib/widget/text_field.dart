import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField(this.labelText,
      {required this.onChanged,
        this.maxLength,
        this.textInputType,
        this.editingController,
        this.suffixChild,
        this.inputFormatter,
        this.color = Colors.blue,
        this.onFocus,
        this.autoFocus,
        Key? key})
      : super(key: key);

  final String labelText;
  final Function(String) onChanged;
  final int? maxLength;
  final TextInputType? textInputType;
  final TextEditingController? editingController;
  final Widget? suffixChild;
  final List<TextInputFormatter>? inputFormatter;
  final Color color;
  final VoidCallback? onFocus;
  final bool? autoFocus;

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool _visibleSuffix = false;

  TextEditingController? _editingController = TextEditingController();
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();

    _focus.addListener(() {
      if (_focus.hasFocus) {
        widget.onFocus?.call();
      }
    });

    if (widget.editingController != null) {
      _editingController = widget.editingController;
    }

    _visibleSuffix = _editingController?.text.isNotEmpty ?? false;

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (widget.autoFocus == true) {
        _focus.requestFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: widget.color),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: widget.color,
          ),
          const BoxShadow(
            color: Colors.white,
            spreadRadius: 0.0,
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: _editingController,
              maxLength: widget.maxLength,
              focusNode: _focus,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
              keyboardType: widget.textInputType,
              inputFormatters: widget.inputFormatter,
              decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 14.0,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.fromLTRB(10.0, 5.0, 5.0, 10.0),
                counterText: '',
              ),
              onChanged: (String value) {
                setState(() {
                  _visibleSuffix = value.isNotEmpty;
                });
                widget.onChanged(value);
              },
            ),
          ),
          Container(
            child: widget.suffixChild ?? Visibility(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    _editingController?.text = '';
                    _editingController?.selection =
                        TextSelection.fromPosition(
                          TextPosition(
                            offset: _editingController?.text.length ?? 0,
                          ),
                        );
                    widget.onChanged('');
                    setState(() {
                      _visibleSuffix = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: widget.color,
                    ),
                  ),
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              visible: _visibleSuffix,
            ),
          ),
        ],
      ),
    );
  }
}