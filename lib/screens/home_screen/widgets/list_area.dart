import 'package:flutter/material.dart';
import 'package:trippanachi_vypari/app_util/log/log_functions.dart';
import 'package:trippanachi_vypari/app_util/pop_menu/pop_menu.dart';
import 'package:trippanachi_vypari/models/member/member.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:trippanachi_vypari/screens/home_screen/cubit/home_cubit.dart';
import 'package:trippanachi_vypari/screens/print_priview/print_priview.dart';

class ListArea extends StatefulWidget {
  final HomeCubit homeCubit;
  final List<Member> memberList;
  final bool showAllMembers;
  const ListArea(
      {super.key,
      required this.memberList,
      required this.homeCubit,
      required this.showAllMembers,
      });

  @override
  State<ListArea> createState() => _ListAreaState();
}

class _ListAreaState extends State<ListArea> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _sortOrder = false;

  @override
  void initState() {
    //_scrollController.jumpTo(0);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Members",
            style: TextStyle(
              fontSize: 36,
              color: Theme.of(context).colorScheme.primary,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: Colors.white,
            child: TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: "Search member here",
                  hintStyle: const TextStyle(color: Colors.black38),
                  suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 16, 8),
                      child: OutlinedButton(
                        onPressed: () {
                          if (widget.showAllMembers) {
                            widget.homeCubit.getAllMembers();
                          } else {
                            final searchKey = _searchController.text.trim();
                            widget.homeCubit.searchMembers(searchKey);
                            _searchController.clear();
                          }
                        },
                        child: widget.showAllMembers
                            ? const Text("Show All Members")
                            : const Text("Search"),
                      )),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.zero))),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
             // color: Colors.white,
              decoration: BoxDecoration(border: Border.all(color: Colors.black54,width: 1),color: Colors.white),
              child: DataTable2(
                scrollController: _scrollController,
                minWidth: 20,
                columnSpacing: 12,
                fixedTopRows: 1,
                fixedLeftColumns: 1,
                isVerticalScrollBarVisible: true,
                 sortColumnIndex: 2,
                 sortAscending: _sortOrder,
                // sortArrowIcon: Icons.sort,
                columns:  [
                  const DataColumn2(
                    label: const Text(
                      "SI No",
                      style: TextStyle(fontSize: 18),
                    ),
                    size: ColumnSize.S,
                  ),
                 const  DataColumn2(
                    label: Text(
                      "Serial No",
                      style: TextStyle(fontSize: 18),
                    ),
                    size: ColumnSize.M,
                  ),
                   DataColumn2(
                    label: const Text(
                      "Name",
                      style: TextStyle(fontSize: 18),
                    ),
                    size: ColumnSize.M,
                    onSort: (sort,value){
                      printError("Sort $sort, $value");
                      _sortOrder = !_sortOrder;
                      
                        widget.homeCubit.sortData(members: widget.memberList);
                      
                      setState(() {});
                    }
                  ),
                  const DataColumn2(
                    label: Text(
                      "Address",
                      style: TextStyle(fontSize: 18),
                    ),
                    size: ColumnSize.L,
                  ),
                  const DataColumn2(
                    label: Text(
                      "Mob Number",
                      style: TextStyle(fontSize: 18),
                    ),
                    size: ColumnSize.M,
                  ),
                  const DataColumn2(
                    label: Text(
                      "Nominee",
                      style: TextStyle(fontSize: 18),
                    ),
                    size: ColumnSize.M,
                  ),
                  const DataColumn2(label: Text(""), size: ColumnSize.S)
                ],
                rows: List.generate(
                  widget.memberList.length,
                  (index) => DataRow2(specificRowHeight: 64, cells: [
                    DataCell(Text(
                      "${index + 1}",
                      style: const TextStyle(fontSize: 16),
                    )),
                    DataCell(Text(
                      widget.memberList[index].serialNo,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    )),
                    DataCell(Text(
                      widget.memberList[index].name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    )),
                    DataCell(Text(widget.memberList[index].address ?? "-")),
                    DataCell(Text(widget.memberList[index].phoneNumber ?? "-")),
                    DataCell(Text(widget.memberList[index].nominiName ?? "-")),
                    DataCell(PopupMenuButton<PopUpMenu>(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.more_vert,
                      ),
                      offset: const Offset(-30, 30),
                      onSelected: (cb) {
                        if (cb.name == PopUpMenu.edit.name) {
                          final membersToEdit = widget.memberList[index];
                          widget.homeCubit.setMembersToEdit(membersToEdit);
                        }
                        if (cb.name == PopUpMenu.delete.name) {
                          widget.homeCubit.showDeleteDialog(widget.memberList[index]);
                        }
                      },
                      itemBuilder: (context) {
                        return <PopupMenuEntry<PopUpMenu>>[
                          const PopupMenuItem<PopUpMenu>(
                            value: PopUpMenu.edit,
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          const PopupMenuItem<PopUpMenu>(
                            value: PopUpMenu.delete,
                            child: Text(
                              "Delete",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ];
                      },
                    )),
                  ]),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const PrintPriviewScreen()));
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(50, 8, 50, 10),
              child: Text(
                "Print",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}
