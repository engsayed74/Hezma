import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hezma_app/features/home/manager/terms_cubit/terms_cubit.dart';
import 'package:hezma_app/widgets/custom_error_widget.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
            padding: EdgeInsets.only(
              top: 32,
              right: 24,
            ),
            child: Center(
                child: Text(
              'الشروط والاحكام',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'STV BOLD'),
            ))),
        //backgroundColor:Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 24,
            )),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<TermsCubit, TermsState>(
            builder: (context, state) {
              if (state is TermsSuccess) {
                return ListView.builder(
                  itemCount: state.terms.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text(state.terms[index].value ?? 'no terms',
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'STV BOLD')),
                    );
                  },
                );
              } else if (state is TermsFailure) {
                return CustomErrorWidget(errMessage: state.errorMesage);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
