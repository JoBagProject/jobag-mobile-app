import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

import '../../ui/input_decoration.dart';

class PostulateScreen extends StatefulWidget {
  const PostulateScreen({Key? key}) : super(key: key);

  @override
  State<PostulateScreen> createState() => _PostulateScreenState();
}

class _PostulateScreenState extends State<PostulateScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Postular'),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Stepper(
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == 3;

            if (isLastStep) {
              print('completed');
            }
            setState(() {
              currentStep += 1;
            });
          },
          onStepCancel: () {
            currentStep == 0 ? null :

            setState(() {
              currentStep -= 1;
            });
          },
          steps: [
            Step(
              state: currentStep > 0 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 0,
              title: Text('Preview'),
              content: _ProfilePreviewStep(),
            ),
            Step(
              state: currentStep > 1 ? StepState.complete : StepState.indexed,
              isActive: currentStep >= 1,
              title: Text('Attach CV'),
              content: ElevatedButton(
                child: Text('Pick File'),
                onPressed: () async {
                  final userDocument = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['pdf']
                  );
                  if ( userDocument == null ) return;

                  final file = userDocument.files.first;
                  openFile(file);
                },
              ),

            )
          ]
        ),
      ),
      );
    }
    
      void openFile(PlatformFile file) {
        OpenFile.open(file.path!);
      }
}

class _ProfilePreviewStep extends StatelessWidget {
  const _ProfilePreviewStep({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [ 
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _ProfilePicture(),
              Container(
                width: 200,
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    _CustomText(text: 'Name: Aurora Aksnes'),
                    SizedBox(height: 30),
                    _CustomText(text: 'Profession: Engineer'),
                    SizedBox(height: 30),
                    _CustomText(text: 'University: University of Oslo'),
                  ],
                )
              ),
              ],
            ),
          Column(
            children: [
              SizedBox(height: 30),
              _CustomText(text: 'Et est dolore consectetur nulla nulla ex.Occaecat aute in proident voluptate veniam ipsum pariatur ut incididunt consequat aliqua occaecat. Sunt eu tempor sit duis. Proident quis nisi fugiat id irure anim commodo commodo dolore non enim ullamco tempor elit. Officia non officia labore reprehenderit.'),
              _CustomText(text: 'Et est dolore consectetur nulla nulla ex.Occaecat aute in proident voluptate veniam ipsum pariatur ut incididunt consequat aliqua occaecat. Sunt eu tempor sit duis. Proident quis nisi fugiat id irure anim commodo commodo dolore non enim ullamco tempor elit. Officia non officia labore reprehenderit.'),
              _CustomText(text: 'Et est dolore consectetur nulla nulla ex.Occaecat aute in proident voluptate veniam ipsum pariatur ut incididunt consequat aliqua occaecat. Sunt eu tempor sit duis. Proident quis nisi fugiat id irure anim commodo commodo dolore non enim ullamco tempor elit. Officia non officia labore reprehenderit.')
            ],
          )
        ]
      ),
    );
  }
}

class _CustomText extends StatelessWidget {
  final String text;
  const _CustomText({
    required String this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text, 
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
         ),
        textAlign: TextAlign.left
        ),
      );
  }
}

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          'https://peopleinmedia.org/wp-content/uploads/2020/07/Aurora-Aksnes-240x320.jpg',
        ),
      ),
    );
  }
}