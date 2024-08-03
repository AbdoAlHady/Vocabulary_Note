import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_cubit.dart';
import 'package:vocabulary_note/logic/read_note_cubit/read_note_state.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  static const List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.cyan,
    Colors.teal,
    Colors.indigo,
    Colors.lime,
    Colors.amber,
    Colors.grey,
    Colors.black,
    Colors.white,
    Colors.deepOrange,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.deepPurple,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNoteCubit, ReadNoteState>(
      builder: (context, state) {
        if (state is ReadNoteLoadingState || state is ReadNoteInitial) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is ReadNoteErrorState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.message),
            ),
          );
        } else if (state is ReadNoteSuccessState) {
          if (state.noteList.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text('No notes found'),
              ),
            );
          } else {
            return SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
              ),
              itemCount: state.noteList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color:  Color(state.noteList[index].colorCode),
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color(state.noteList[index].colorCode).withOpacity(0.3),
                         Color(state.noteList[index].colorCode)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      state.noteList[index].text,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          
        }

        return const SizedBox.shrink();
      },

    );
  }
}
