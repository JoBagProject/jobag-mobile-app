import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mi_proyecto/widgets/widgets.dart';

import '../../models/job_offer/job_offer_model.dart';

class JobDetailsScreen extends StatelessWidget {


  const JobDetailsScreen({
    super.key,

    });

  @override
  Widget build(BuildContext context) {
    final JobOffer jobOffer = ModalRoute.of(context)!.settings.arguments as JobOffer;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(jobOffer),
          SliverList(
            delegate: SliverChildListDelegate([
              _Overview(jobOffer),
            ]
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                  title: 'Postular',
                  action: () => Navigator.pushNamed(context, 'postulate_screen'),
                ),
            ),
          )
        ],
      )
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final JobOffer jobOffer;
  const _CustomAppBar(this.jobOffer);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only( bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            jobOffer.title,
            style: TextStyle( fontSize: 16 ),
            textAlign: TextAlign.center,
          ),
        ),

        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage( 'https://www.upc.edu.pe/nosotros/campus/campus-monterrico/img/monterrico-1.jpg' ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final JobOffer jobOffer;

  const _Overview(this.jobOffer);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        jobOffer.description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      )
    );
  }
}
