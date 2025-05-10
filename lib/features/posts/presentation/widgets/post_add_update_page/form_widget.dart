import 'package:article/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/windows.dart';
import '../../../domain/entities/post.dart';
import 'form_submit_button_widget.dart';
import 'text_form_field_widget.dart';


class FormWidget extends StatefulWidget {
  final Post? post;

  const FormWidget({super.key, this.post});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  bool isEditMode = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isEditMode = widget.post != null;
    if (isEditMode) {
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
  }



  void validateAndSubmit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    _formKey.currentState!.save();

    final post = Post(
      id: isEditMode ? widget.post!.id : null,
      title: titleController.text,
      body: bodyController.text,
    );

    final bloc = BlocProvider.of<AddDeleteUpdatePostBloc>(context);

    if (isEditMode) {
      bloc.add(UpdatePostEvent(post: post));
    } else {
      bloc.add(AddPostEvent(post: post));
    }
  }

  @override
  Widget build(BuildContext context) {void validateAndSubmit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    _formKey.currentState!.save();

    final post = Post(
      id: isEditMode ? widget.post!.id : null, // ✅ Fix here
      title: titleController.text,
      body: bodyController.text,
    );

    final bloc = BlocProvider.of<AddDeleteUpdatePostBloc>(context);

    if (isEditMode) {
      bloc.add(UpdatePostEvent(post: post));
    } else {
      bloc.add(AddPostEvent(post: post));
    }
  }


  return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 300),
            child: TextFormFieldWidget(
              name: 'Title',
              controller: titleController,
              multiLine: false,
            ),
          ),
          SizedBox(height: Window.getVerticalSize(16)),
          AnimatedOpacity(
            opacity: 1.0,
            duration: const Duration(milliseconds: 300),
            child: TextFormFieldWidget(
              name: 'Body',
              controller: bodyController,
              multiLine: true,
            ),
          ),
          SizedBox(height: Window.getVerticalSize(24)),
          AnimatedScale(
            scale: 1.0,
            duration: const Duration(milliseconds: 200),
            child: FormSubmitButtonWidget(
              isEditMode: isEditMode,
              onSubmit: validateAndSubmit,
            ),
          ),
        ],
      ),
    );
  }
}