# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
traits = Trait.create([
  { name: "Accountable",
    is_recruiter: false
  },
  { name: "Attentive",
    is_recruiter: false,
  },
  { name: "Benefits",
    is_recruiter: true,
    description: "I need the best healthcare, dental & eye coverage; I am a dare devil, you know?"
  },
  { name: "Clear corporate strategy",
    is_recruiter: true,
    description: "I need clear instruction, do NOT deviate from the said plan."
  },
  { name: "Coaching",
    is_recruiter: true,
    description: "Can I wear a purple suit with converses to the bank meeting?"
  },
  { name: "Communicator",
    is_recruiter: false
  },
  { name: "Community Service",
    is_recruiter: true,
    description: "Giving back is essential, I get joy out of helping others."
  },
  { name: "Company name recognition",
    is_recruiter: true,
    description: "I work for the largest investment bank…boutique bank, that’s cool, I guess."
  },
  { name: "Consistent",
    is_recruiter: false
  },
  { name: "Creative",
    is_recruiter: false
  },
  { name: "Curious",
    is_recruiter: false
  },
  { name: "Disciplined",
    is_recruiter: false
  },
  { name: "Dynamic",
    is_recruiter: false
  },
  { name: "Energetic",
    is_recruiter: false
  },
  { name: "Entrepreneurial",
    is_recruiter: true,
    description: "Status quo, boring. Calculated risk and learning through failure is of utmost importance. Zuckerberg did it."
  },
  { name: "Ethical",
    is_recruiter: false
  },
  { name: "Fiscal Compensation",
    is_recruiter: true,
    description: "Salary & bonus, it’s all about the benjamins."
  },
  { name: "Growth & Development",
    is_recruiter: true,
    description: "I got this far, it’s time for you to train me."
  },
  { name: "Hard working",
    is_recruiter: false
  },
  { name: "Honest",
    is_recruiter: false
  },
  { name: "Humorous",
    is_recruiter: false
  },
  { name: "Independent",
    is_recruiter: false
  },
  { name: "Job Recognition",
    is_recruiter: true,
    description: "A pat on the back every now & again would be nice."
  },
  { name: "Job Security",
    is_recruiter: true,
    description: "The way my bank is set up, I need my job for the next 36 months."
  },
  { name: "Meticulous",
    is_recruiter: false
  },
  { name: "Organized",
    is_recruiter: false
  },
  { name: "Resourceful",
    is_recruiter: false
  },
  { name: "Supportive",
    is_recruiter: false
  },
  { name: "Team Player",
    is_recruiter: false
  },
  { name: "Tenacious",
    is_recruiter: false
  },
  { name: "Vacation",
    is_recruiter: true,
    description: "Caribbean here I come, two Bahama Mamas please."
  },
  { name: "Work Life Balance",
    is_recruiter: true,
    description: "No emails past 8:59pm EST. Grey’s Anatomy comes on at 9."
  },
  { name: "Work Travel",
    is_recruiter: true,
    description: "Jet life on company dime, nice….skymiles nicer!"
  }
])

competencies = Competency.create([
  { name: "Accounting" },
  { name: "Back End Developer" },
  { name: "Bookkeeping" },
  { name: "Cinematography" },
  { name: "Corporate Banking" },
  { name: "Culinary" },
  { name: "Cyber Security" },
  { name: "Data Analytics" },
  { name: "Digital Marketing" },
  { name: "ERP" },
  { name: "Engineering" },
  { name: "Front End Developer" },
  { name: "Full Stack" },
  { name: "Graphic Design" },
  { name: "Insurance" },
  { name: "Investment Banking" },
  { name: "Logistics" },
  { name: "Marketing" },
  { name: "Nonprofit" },
  { name: "Professional Admin" },
  { name: "Programming" },
  { name: "Project Management" },
  { name: "Public Relations" },
  { name: "Quality Control" },
  { name: "Quantitative" },
  { name: "Real Estate" },
  { name: "Recruiting" },
  { name: "Research" },
  { name: "Sales" },
  { name: "Sales and Trading" },
  { name: "Social Media" },
  { name: "Software Development" },
  { name: "Strategy" },
  { name: "Tax Professional" },
  { name: "Teaching" },
  { name: "Technical Support" },
  { name: "Urban Planning" },
  { name: "Web Development" }
])

[
  "Accounting",
  "Airlines/Aviation",
  "Alternative Dispute Resolution",
  "Alternative Medicine",
  "Animation",
  "Apparel & Fashion",
  "Architecture & Planning",
  "Arts & Crafts",
  "Automotive",
  "Aviation & Aerospace",
  "Banking",
  "Biotechnology",
  "Broadcast Media",
  "Building Materials",
  "Business Supplies & Equipment",
  "Capital Markets",
  "Chemicals",
  "Civic & Social Organization",
  "Civil Engineering",
  "Commercial Real Estate",
  "Computer & Network Security",
  "Computer Games",
  "Computer Hardware",
  "Computer Networking",
  "Computer Software",
  "Construction",
  "Consumer Electronics",
  "Consumer Goods",
  "Consumer Services",
  "Cosmetics",
  "Dairy",
  "Defense & Space",
  "Design",
  "Education Management",
  "E-learning",
  "Electrical & Electronic Manufacturing",
  "Entertainment",
  "Environmental Services",
  "Events Services",
  "Executive Office",
  "Facilities Services",
  "Farming",
  "Financial Services",
  "Fine Art",
  "Fishery",
  "Food & Beverages",
  "Food Production",
  "Fundraising",
  "Furniture",
  "Gambling & Casinos",
  "Glass, Ceramics & Concrete",
  "Government Administration",
  "Government Relations",
  "Graphic Design",
  "Health, Wellness & Fitness",
  "Higher Education",
  "Hospital & Health Care",
  "Hospitality",
  "Human Resources",
  "Import & Export",
  "Individual & Family Services",
  "Industrial Automation",
  "Information Services",
  "Information Technology & Services",
  "Insurance",
  "International Affairs",
  "International Trade & Development",
  "Internet",
  "Investment Banking/Venture",
  "Investment Management",
  "Judiciary",
  "Law Enforcement",
  "Law Practice",
  "Legal Services",
  "Legislative Office",
  "Leisure & Travel",
  "Libraries",
  "Logistics & Supply Chain",
  "Luxury Goods & Jewelry",
  "Machinery",
  "Management Consulting",
  "Maritime",
  "Marketing & Advertising",
  "Market Research",
  "Mechanical or Industrial Engineering",
  "Media Production",
  "Medical Device",
  "Medical Practice",
  "Mental Health Care",
  "Military",
  "Mining & Metals",
  "Motion Pictures & Film",
  "Museums & Institutions",
  "Music",
  "Nanotechnology",
  "Newspapers",
  "Nonprofit Organization Management",
  "Oil & Energy",
  "Online Publishing",
  "Outsourcing/Offshoring",
  "Package/Freight Delivery",
  "Packaging & Containers",
  "Paper & Forest Products",
  "Performing Arts",
  "Pharmaceuticals",
  "Philanthropy",
  "Photography",
  "Plastics",
  "Political Organization",
  "Primary/Secondary",
  "Printing",
  "Professional Training",
  "Program Development",
  "Public Policy",
  "Public Relations",
  "Public Safety",
  "Publishing",
  "Railroad Manufacture",
  "Ranching",
  "Real Estate",
  "Recreational",
  "Facilities & Services",
  "Religious Institutions",
  "Renewables & Environment",
  "Research",
  "Restaurants",
  "Retail",
  "Security & Investigations",
  "Semiconductors",
  "Shipbuilding",
  "Sporting Goods",
  "Sports",
  "Staffing & Recruiting",
  "Supermarkets",
  "Telecommunications",
  "Textiles",
  "Think Tanks",
  "Tobacco",
  "Translation & Localization",
  "Transportation/Trucking/Railroad",
  "Utilities",
  "Venture Capital",
  "Veterinary",
  "Warehousing",
  "Wholesale",
  "Wine & Spirits",
  "Wireless",
  "Writing & Editing"
].each do |industry|
  Industry.create(name: industry)
end

Personality.create([
  {
    name: "Engineer",
    code: "INSO",
    description: ""
  },
  {
    name: "Philosopher",
    code: "INSA",
    description: ""
  },
  {
    name: "Chief",
    code: "ENSO",
    description: ""
  },
  {
    name: "Raconteur",
    code: "ENSA",
    description: ""
  },
  {
    name: "Crusader",
    code: "INMO",
    description: ""
  },
  {
    name: "Peacemaker",
    code: "INMA",
    description: ""
  },
  {
    name: "Principal",
    code: "ENMO",
    description: ""
  },
  {
    name: "Activist",
    code: "ENMA",
    description: ""
  },
  {
    name: "Referee",
    code: "IVSO",
    description: ""
  },
  {
    name: "Protector",
    code: "IVMO",
    description: ""
  },
  {
    name: "CEO",
    code: "EVSO",
    description: ""
  },
  {
    name: "Diplomat",
    code: "EVMO",
    description: ""
  },
  {
    name: "Prodigy",
    code: "IVSA",
    description: ""
  },
  {
    name: "Daredevil",
    code: "IVMA",
    description: ""
  },
  {
    name: "Mogul",
    code: "EVSA",
    description: ""
  },
  {
    name: "Artiste",
    code: "EVMA",
    description: ""
  }
])

AssessmentQuestion.create([
  {
    category: "IE",
    question: "You find it challenging to introduce yourself to other people.",
    page_number: 1
  },
  {
    category: "VN",
    question: "You often get so consumed in your thoughts that you ignore or forget your surroundings.",
    page_number: 1,
    format: 1
  },
  {
    category: "OA",
    question: "You try to respond to your e-mails as soon as possible and cannot stand a messy inbox.",
    page_number: 1
  },
  {
    category: "PT",
    question: "You find it easy to keep relaxed even when there is pressure.",
    page_number: 1
  },
  {
    category: "IE",
    question: "You do not typically initiate conversations.",
    page_number: 1
  },
  {
    category: "VN",
    question: "You rarely do something just out of sheer curiosity.",
    page_number: 1,
    format: 1
  },
  {
    category: "PT",
    question: "You feel superior to other people.",
    page_number: 1
  },
  {
    category: "OA",
    question: "Being organized is more important to you than being adaptable.",
    page_number: 1
  },

  {
    category: "IE",
    question: "You are usually highly motivated and energetic.",
    page_number: 1,
    format: 1
  },
  {
    category: "SM",
    question: "Winning a debate matters less to you than ensuring  no one gets upset.",
    page_number: 1,
    format: 1
  },
  {
    category: "PT",
    question: "You often feel as if you have to justify yourself to other people.",
    page_number: 1,
    format: 1
  },
  {
    category: "OA",
    question: "You keep your home and work environment quite tidy.",
    page_number: 1
  },
  # Page 2
  {
    category: "IE",
    question: "You do not mind being at the center of attention.",
    page_number: 2,
    format: 1
  },
  {
    category: "VN",
    question: "You consider yourself more practical than creative.",
    page_number: 2
  },
  {
    category: "PT",
    question: "People can rarely upset you.",
    page_number: 2
  },
  {
    category: "OA",
    question: "Your road trips are usually well thought out.",
    page_number: 2
  },
  {
    category: "SM",
    question: "It is difficult to relate to other people’s feelings.",
    page_number: 2
  },
  {
    category: "SM",
    question: "Your mood can change very quickly.",
    page_number: 2,
    format: 1
  },
  {
    category: "SM",
    question: "In a discussion, truth should be more important than people’s sensitivities.",
    page_number: 2
  },
  {
    category: "SM",
    question: "You rarely worry about how your actions affect other people.",
    page_number: 2
  },
  {
    category: "OA",
    question: "Your work style is more sporadic than an organized and methodical approach.",
    page_number: 2,
    format: 1
  },
  {
    category: "PT",
    question: "You are often envious of others.",
    page_number: 2,
    format: 1
  },
  {
    category: "IE",
    question: "An interesting book or video game is often better than a social event.",
    page_number: 2
  },
  {
    category: "OA",
    question: "The ability to develop a plan and follow it is the most important part of every project.",
    page_number: 2
  },
  # Page 3
  {
    category: "VN",
    question: "You rarely get carried away by fantasies and ideas.",
    page_number: 3
  },
  {
    category: "VN",
    question: "You often find yourself lost in thought when you are walking in nature.",
    page_number: 3,
    format: 1
  },
  {
    category: "PT",
    question: "If someone does not respond to your e-mail within a reasonable time, you start worrying if you said something wrong.",
    page_number: 3,
    format: 1
  },
  {
    category: "SM",
    question: "As a parent, you would rather see your child grow up kind than smart.",
    page_number: 3,
    format: 1
  },
  {
    category: "PT",
    question: "You do not let other people influence your actions.",
    page_number: 3
  },
  {
    category: "VN",
    question: "When you sleep, your dreams tend to focus on the real world and its events.",
    page_number: 3
  },
  {
    category: "IE",
    question: "You find ways to get involved socially quickly in a new organization.",
    page_number: 3,
    format: 1
  },
  {
    category: "OA",
    question: "You are more of a natural improviser than a careful planner.",
    page_number: 3,
    format: 1
  },
  {
    category: "SM",
    question: "Your emotions control you more than you control them.",
    page_number: 3,
    format: 1
  },
  {
    category: "IE",
    question: "You enjoy going to social events that involve dress-up or role-play activities.",
    page_number: 3,
    format: 1
  },
  {
    category: "VN",
    question: "You often spend time exploring unrealistic and impractical yet appealing ideas.",
    page_number: 3,
    format: 1
  },
  {
    category: "OA",
    question: "You would rather improvise than spend time coming up with a detailed plan.",
    page_number: 3,
    format: 1
  },
  # Page 4
  {
    category: "IE",
    question: "Most times you are reserved and a quiet person.",
    page_number: 4
  },
  {
    category: "PT",
    question: "If you had a business, you would find it very difficult to fire loyal but underperforming employees.",
    page_number: 4,
    format: 1
  },
  {
    category: "VN",
    question: "You often ponder the reasons for human existence.",
    page_number: 4,
    format: 1
  },
  {
    category: "SM",
    question: "Logic is usually more important than heart when making important decisions.",
    page_number: 4
  },
  {
    category: "OA",
    question: "It is more important to keep your options open than having a to-do list.",
    page_number: 4,
    format: 1
  },
  {
    category: "SM",
    question: "If your friend is sad about something, you are more likely to offer emotional support than offer ways to deal with the problem.",
    page_number: 4,
    format: 1
  },
  {
    category: "PT",
    question: "You rarely feel insecure.",
    page_number: 4
  },
  {
    category: "OA",
    question: "You do not have difficulties coming up with a personal schedule and sticking to it.",
    page_number: 4
  },
  {
    category: "SM",
    question: "During teamwork, being right is more important than being cooperative.",
    page_number: 4
  },
  {
    category: "SM",
    question: "You think that everyone’s views should be respected even if they are not supported by facts.",
    page_number: 4,
    format: 1
  },
  {
    category: "IE",
    question: "You feel more energetic after going out with a group of people.",
    page_number: 4,
    format: 1
  },
  {
    category: "OA",
    question: "You frequently misplace your things.",
    page_number: 4,
    format: 1
  },
  # Page 5
  {
    category: "SM",
    question: "You believe you are very emotionally stable.",
    page_number: 5
  },
  {
    category: "VN",
    question: "Your mind is always wondering with unexplored ideas and plans.",
    page_number: 5,
    format: 1
  },
  {
    category: "VN",
    question: "You would not call yourself a dreamer.",
    page_number: 5
  },
  {
    category: "IE",
    question: "You usually find it difficult to relax when talking in front of many people.",
    page_number: 5
  },
  {
    category: "VN",
    question: "You rely more on your personal experience than your imagination.",
    page_number: 5
  },
  {
    category: "PT",
    question: "You worry constantly about what other people think.",
    page_number: 5,
    format: 1
  },
  {
    category: "IE",
    question: "When in a full room, you are sure to stay closer to the walls, avoiding the center.",
    page_number: 5
  },
  {
    category: "OA",
    question: "You have a habit to procrastinate until there is not enough time to do everything.",
    page_number: 5,
    format: 1
  },
  {
    category: "PT",
    question: "You have anxiety in stressful situations.",
    page_number: 5,
    format: 1
  },
  {
    category: "PT",
    question: "You believe that it is more rewarding to be liked by others than to be powerful.",
    page_number: 5,
    format: 1
  },
  {
    category: "VN",
    question: "You have always been interested in unconventional and imaginative things, e.g. in books, art, or movies.",
    page_number: 5,
    format: 1
  },
  {
    category: "IE",
    question: "You often take lead in social situations.",
    page_number: 5,
    format: 1
  }
])
