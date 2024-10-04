import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_farabi_app/features/auth/presentation/widgets/back_btn.dart';
import 'package:flutter_farabi_app/features/history/presentation/bloc/get_all_history/get_all_history_cubit.dart';
import 'package:flutter_farabi_app/features/history/presentation/view/all_history_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AllHistorySpace extends StatefulWidget {
  const AllHistorySpace({super.key});

  @override
  State<AllHistorySpace> createState() => _AllHistorySpaceState();
}

class _AllHistorySpaceState extends State<AllHistorySpace> {
  @override
  void initState() {
    super.initState();
    context.read<GetAllHistoryCubit>().getAllHistory();
  }

  Future<void> _refreshPage() async {
    context.read<GetAllHistoryCubit>().getAllHistory();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromRGBO(247, 247, 249, 1),
          leading: GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(5),
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                // color: color ?? AppConst.pageSecondaryBgColor,
                borderRadius: BorderRadius.circular(40.r),
              ),
              child: Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20.h,
                    color: const Color.fromRGBO(43, 43, 43, 1),
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            "Notifications",
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(
              fontSize: 18.sp,
              color: const Color.fromRGBO(43, 43, 43, 1),
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: RefreshIndicator(
              onRefresh: _refreshPage,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                child: const AllHistory(),
              ),
              ),
            )),
      ),
    );
  }
}
