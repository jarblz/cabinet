task :add_synonyms => :environment do

  Trait.find_by_name("Attentive").first_synonyms << [
    Trait.find_by_name("Meticulous")
  ]
  Trait.find_by_name("Attentive").second_synonyms << [
    Trait.find_by_name("Organized")
  ]
  Trait.find_by_name("Consistent").first_synonyms << [
    Trait.find_by_name("Disciplined")
  ]
  Trait.find_by_name("Consistent").second_synonyms << [
    Trait.find_by_name("Accountable")
  ]
  Trait.find_by_name("Dynamic").first_synonyms << [
    Trait.find_by_name("Energetic")
  ]
  Trait.find_by_name("Hard working").first_synonyms << [
    Trait.find_by_name("Tenacious")
  ]
  Trait.find_by_name("Honest").first_synonyms << [
    Trait.find_by_name("Ethical")
  ]

  Trait.find_by_name("Resourceful").first_synonyms << [
    Trait.find_by_name("Independent")
  ]
  Trait.find_by_name("Resourceful").second_synonyms << [
    Trait.find_by_name("Creative")
  ]

  Trait.find_by_name("Supportive").first_synonyms << [
    Trait.find_by_name("Team Player")
  ]
  Trait.find_by_name("Supportive").second_synonyms << [
    Trait.find_by_name("Communicator")
  ]

  Competency.find_by_name("Accounting").second_synonyms << [
    Competency.find_by_name("Bookkeeping"),
    Competency.find_by_name("Corporate Banking"),
    Competency.find_by_name("Investment Banking"),
    Competency.find_by_name("Tax Professional")
   ]
  #
  Competency.find_by_name("Back End Developer").second_synonyms << [
    Competency.find_by_name("Cyber Security"),
    Competency.find_by_name("Engineering"),
    Competency.find_by_name("Front End Developer"),
    Competency.find_by_name("Programming")
  ]
  Competency.find_by_name("Back End Developer").first_synonyms << [
    Competency.find_by_name("Full Stack")]

  Competency.find_by_name("Bookkeeping").second_synonyms << [
    Competency.find_by_name("Accounting")]

  Competency.find_by_name("Cinematography").second_synonyms << [
    Competency.find_by_name("Graphic Design")]

  Competency.find_by_name("Consulting").second_synonyms << [
    Competency.find_by_name("Strategy")]


  Competency.find_by_name("Corporate Banking").second_synonyms << [
    Competency.find_by_name("Accounting"),
    Competency.find_by_name("Investment Banking")]


  Competency.find_by_name("Cyber Security").second_synonyms << [
    Competency.find_by_name("Programming")
   ]
  #
  Competency.find_by_name("Cyber Security").third_synonyms << [
    Competency.find_by_name("Back End Developer"),
    Competency.find_by_name("Engineering"),
    Competency.find_by_name("Front End Developer"),
    Competency.find_by_name("Full Stack")
  ]

  Competency.find_by_name("Data Analytics").second_synonyms << [
    Competency.find_by_name("Quantitative")
  ]

  Competency.find_by_name("Digital Marketing").third_synonyms << [
    Competency.find_by_name("Data Analytics")
  ]

  Competency.find_by_name("Digital Marketing").second_synonyms << [
    Competency.find_by_name("Marketing")
  ]

  Competency.find_by_name("ERP").third_synonyms << [
    Competency.find_by_name("Programming")
  ]
  Competency.find_by_name("Engineering").third_synonyms << [
    Competency.find_by_name("Programming")
  ]
  Competency.find_by_name("Front End Developer").second_synonyms << [
    Competency.find_by_name("Back End Developer"),
    Competency.find_by_name("Cyber Security"),
    Competency.find_by_name("Engineering"),
    Competency.find_by_name("Programming")
  ]
  Competency.find_by_name("Full Stack").second_synonyms << [
    Competency.find_by_name("Back End Developer"),
    Competency.find_by_name("Front End Developer"),
    Competency.find_by_name("Programming")
  ]
  Competency.find_by_name("Full Stack").third_synonyms << [
    Competency.find_by_name("Engineering")
  ]
  Competency.find_by_name("Graphic Design").third_synonyms << [
    Competency.find_by_name("Cinematography")
  ]
  Competency.find_by_name("Insurance").third_synonyms << [
    Competency.find_by_name("Sales")
  ]
  Competency.find_by_name("Investment Banking").second_synonyms << [
    Competency.find_by_name("Accounting"),
    Competency.find_by_name("Corporate Banking")
  ]
  Competency.find_by_name("Logistics").third_synonyms << [
    Competency.find_by_name("Quality Control")
  ]
  Competency.find_by_name("Marketing").third_synonyms << [
    Competency.find_by_name("Data Analytics"),
    Competency.find_by_name("Digital Marketing")
  ]
  Competency.find_by_name("Nonprofit").third_synonyms << [
    Competency.find_by_name("Public Relations"),
    Competency.find_by_name("Urban Planning")
  ]

  Competency.find_by_name("Programming").second_synonyms << [
    Competency.find_by_name("Back End Developer"),
    Competency.find_by_name("Cyber Security"),
    Competency.find_by_name("Engineering"),
    Competency.find_by_name("Full Stack"),
    Competency.find_by_name("Front End Developer")
  ]

  Competency.find_by_name("Project Management").third_synonyms << [
    Competency.find_by_name("Engineering")
  ]
  Competency.find_by_name("Public Relations").third_synonyms << [
    Competency.find_by_name("Marketing")
  ]
  Competency.find_by_name("Quality Control").third_synonyms << [
    Competency.find_by_name("Logistics")
  ]
  Competency.find_by_name("Quantitative").second_synonyms << [
    Competency.find_by_name("Data Analytics")
  ]
  Competency.find_by_name("Research").third_synonyms << [
    Competency.find_by_name("Engineering")
  ]
  Competency.find_by_name("Sales").third_synonyms << [
    Competency.find_by_name("Marketing")
  ]
  Competency.find_by_name("Sales and Trading").second_synonyms << [
    Competency.find_by_name("Investment Banking")
  ]
  Competency.find_by_name("Sales and Trading").third_synonyms << [
    Competency.find_by_name("Accounting")
  ]
  Competency.find_by_name("Social Media").second_synonyms << [
    Competency.find_by_name("Digital Marketing")
  ]

  Competency.find_by_name("Software Development").second_synonyms << [
    Competency.find_by_name("Back End Developer"),
    Competency.find_by_name("Cyber Security"),
    Competency.find_by_name("Front End Developer"),
    Competency.find_by_name("Full Stack")
  ]
  Competency.find_by_name("Software Development").third_synonyms << [
    Competency.find_by_name("Engineering")
  ]
  Competency.find_by_name("Strategy").second_synonyms << [
    Competency.find_by_name("Consulting")
  ]
  Competency.find_by_name("Tax Professional").second_synonyms << [
    Competency.find_by_name("Accounting")
  ]
  Competency.find_by_name("Technical Support").third_synonyms << [
    Competency.find_by_name("Engineering")
  ]
  Competency.find_by_name("Urban Planning").third_synonyms << [
    Competency.find_by_name("Nonprofit")
  ]

  Competency.find_by_name("Web Development").second_synonyms << [
    Competency.find_by_name("Back End Developer"),
    Competency.find_by_name("Front End Developer"),
    Competency.find_by_name("Programming"),
    Competency.find_by_name("Full Stack")
  ]
  Competency.find_by_name("Web Development").third_synonyms << [
    Competency.find_by_name("Engineering")
  ]

end
