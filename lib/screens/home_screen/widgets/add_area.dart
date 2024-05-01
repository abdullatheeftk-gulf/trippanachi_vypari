import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trippanachi_vypari/app_util/field_focus_change/field_focus_change.dart';
import 'package:trippanachi_vypari/models/member/member.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/edit_state/home_edit_state.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/home_cubit.dart';

class AddArea extends StatefulWidget {
  final HomeCubit homeCubit;
  final bool showProgressBar;

  const AddArea({
    super.key,
    required this.homeCubit,
    required this.showProgressBar,
  });

  @override
  State<AddArea> createState() => _AddAreaState();
}

class _AddAreaState extends State<AddArea> {
  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nomineeController = TextEditingController();
  final TextEditingController _nomineeRelationController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Member? _memberToEdit;

  final FocusNode _serailFocusNode = FocusNode();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _nomineeFocusNode = FocusNode();
  final FocusNode _nomineeRelationFocusNode = FocusNode();

  @override
  void dispose() {
    _serialNoController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _nomineeController.dispose();
    _nomineeRelationController.dispose();
    super.dispose();
  }

 

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (prev, cur) {
        if (cur is HomeEditState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is HomeEditState) {
          _memberToEdit = state.member;
          _serialNoController.text = _memberToEdit?.serialNo ?? "";
          _nameController.text = _memberToEdit?.name ?? "";
          _addressController.text = _memberToEdit?.address ?? "";
          _phoneNumberController.text = _memberToEdit?.phoneNumber ?? "";
          _nomineeController.text = _memberToEdit?.nomineeName ?? "";
          _nomineeRelationController.text = _memberToEdit?.nomineeRelation ?? "";
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  _memberToEdit == null ? "Add Member" : "Update Member",
                  style: TextStyle(
                      fontSize: 36,
                      color: Theme.of(context).colorScheme.primary,
                      decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 20,
                ),


                // Serial No row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Serial No:- ",
                          style: TextStyle(fontSize: 22),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                            controller: _serialNoController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.zero))),
                            validator: (value) {
                              if (value == null) {
                                return "Null value";
                              }
                              if (value.isEmpty) {
                                return "Empty serial No";
                              }
                              return null;
                            },
                            focusNode: _serailFocusNode,
                            onFieldSubmitted: (value) {
                              fieldFocusChange(
                                  context, _serailFocusNode, _nameFocusNode);
                            }),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),


                // Name row
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Name:- ",
                          style: TextStyle(fontSize: 22),
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.white,
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.zero),
                              ),
                            ),
                            validator: (value) {
                              if (value == null) {
                                return "Null value";
                              }
                              if (value.isEmpty) {
                                return "Empty Member name";
                              }
                              return null;
                            },
                            focusNode: _nameFocusNode,
                            onFieldSubmitted: (value) {
                              fieldFocusChange(
                                  context, _nameFocusNode, _addressFocusNode);
                            },
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),


                // Address row
                Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Address:- ",
                          style: TextStyle(fontSize: 22),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: _addressController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.zero))),
                          maxLines: 3,
                          focusNode: _addressFocusNode,
                          onFieldSubmitted: (value) {
                            fieldFocusChange(context, _addressFocusNode,
                                _phoneNumberFocusNode);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),


                // Phone number row
                Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Phone number:- ",
                          style: TextStyle(fontSize: 22),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: _phoneNumberController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                          focusNode: _phoneNumberFocusNode,
                          onFieldSubmitted: (value) {
                            fieldFocusChange(context, _phoneNumberFocusNode,
                                _nomineeFocusNode);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),

                // Nominee row
                Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Nominee Name:- ",
                          style: TextStyle(fontSize: 22),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: _nomineeController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                          focusNode: _nomineeFocusNode,
                          onFieldSubmitted: (value) {
                            fieldFocusChange(context, _nomineeFocusNode,
                                _nomineeRelationFocusNode,);
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),

                // Nominee Relation row
                Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Text(
                          "Nominee Relation:- ",
                          style: TextStyle(fontSize: 22),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.white,
                        child: TextFormField(
                          controller: _nomineeRelationController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.zero),
                            ),
                          ),
                          focusNode: _nomineeRelationFocusNode,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 32,),

                // Button row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: widget.showProgressBar
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                if (_memberToEdit != null) {
                                  final member = Member(
                                    id: _memberToEdit?.id ?? 0,
                                    serialNo: _serialNoController.text.trim(),
                                    name: _nameController.text.trim(),
                                    address: _addressController.text.trim(),
                                    phoneNumber:
                                        _phoneNumberController.text.trim(),
                                    nomineeName: _nomineeController.text.trim(),
                                    nomineeRelation: _nomineeRelationController.text.trim(),
                                    dateTime: _memberToEdit?.dateTime ??
                                        DateTime.now(),
                                  );

                                  widget.homeCubit.updateMemberData(member);
                                  _serialNoController.clear();
                                  _nameController.clear();
                                  _addressController.clear();
                                  _phoneNumberController.clear();
                                  _nameController.clear();
                                  _nomineeController.clear();
                                  _nomineeRelationController.clear();
                                } else {
                                  final member = Member(
                                    serialNo: _serialNoController.text.trim(),
                                    name: _nameController.text.trim(),
                                    address: _addressController.text.trim(),
                                    phoneNumber:
                                        _phoneNumberController.text.trim(),
                                    nomineeName: _nomineeController.text.trim(),
                                    nomineeRelation: _nomineeRelationController.text.trim(),
                                    dateTime: DateTime.now(),
                                  );
                                  widget.homeCubit.insertMemberdata(member);
                                  _serialNoController.clear();
                                  _nameController.clear();
                                  _addressController.clear();
                                  _phoneNumberController.clear();
                                  _nameController.clear();
                                  _nomineeController.clear();
                                  _nomineeRelationController.clear();
                                }

                                //widget.homeCubit.getAllMembers();
                              }
                            },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 8, 50, 10),
                        child: Text(
                          widget.showProgressBar
                              ? "Loading"
                              : _memberToEdit == null
                                  ? "Save"
                                  : "Update",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    if (_memberToEdit != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 16,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                widget.homeCubit.cancelUpdate();
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.indigo),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(50, 8, 50, 10),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(fontSize: 18),
                                ),
                              )),
                        ],
                      )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
