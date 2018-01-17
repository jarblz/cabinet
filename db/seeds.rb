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
