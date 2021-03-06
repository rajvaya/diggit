import 'package:auto_size_text/auto_size_text.dart';
import 'package:diggit/models/reposModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Component to show a list of the repos by the person
// you came across on digGit
class RepoList extends StatelessWidget {
  final Repos repos;
  RepoList({this.repos});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, left: 35, bottom: 15),
      width: 270,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.grey[500], blurRadius: 20)]),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              child: AutoSizeText(
                repos.name ?? 'Repo Name',
                maxLines: 1,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            AutoSizeText(
              repos.language ?? 'Language',
              maxLines: 1,
              style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600]),
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Expanded(
                child: AutoSizeText(
                  repos.description ?? 'Description',
                  maxLines: 4,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
