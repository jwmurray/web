# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

doc = Document.create(title: "Felicia's Affidavit 2-17-2014-om.pdf");
Byline.create();

doc2 = Document.create(title: "testdocument.docx");

author1 = Author.create(name: 'Jared Steele');

doc2.authors << author1




