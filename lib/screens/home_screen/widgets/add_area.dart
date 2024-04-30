import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:trippanachi_vypari/app_util/log/log_functions.dart';
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
  final TextEditingController _nominiController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Member? _memberToEdit;

  @override
  void dispose() {
    _serialNoController.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    _nominiController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
          _nominiController.text = _memberToEdit?.nominiName ?? "";
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
                                  borderRadius: BorderRadius.all(Radius.zero))),
                          validator: (value) {
                            if (value == null) {
                              return "Null value";
                            }
                            if (value.isEmpty) {
                              return "Empty serial No";
                            }
                            return null;
                          },
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
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
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
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
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
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
                                    borderRadius:
                                        BorderRadius.all(Radius.zero))),
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
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
                          controller: _nominiController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.zero))),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
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
                                    nominiName: _nominiController.text.trim(),
                                    dateTime: _memberToEdit?.dateTime ??
                                        DateTime.now(),
                                  );

                                  widget.homeCubit.updateMemberData(member);
                                  _serialNoController.clear();
                                  _nameController.clear();
                                  _addressController.clear();
                                  _phoneNumberController.clear();
                                  _nameController.clear();
                                  _nominiController.clear();
                                } else {
                                  final member = Member(
                                    serialNo: _serialNoController.text.trim(),
                                    name: _nameController.text.trim(),
                                    address: _addressController.text.trim(),
                                    phoneNumber:
                                        _phoneNumberController.text.trim(),
                                    nominiName: _nominiController.text.trim(),
                                    dateTime: DateTime.now(),
                                  );
                                  widget.homeCubit.insertMemberdata(member);
                                  _serialNoController.clear();
                                  _nameController.clear();
                                  _addressController.clear();
                                  _phoneNumberController.clear();
                                  _nameController.clear();
                                  _nominiController.clear();
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
                                        foregroundColor: MaterialStateProperty.all<Color>(
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
