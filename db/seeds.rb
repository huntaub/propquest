# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
sA = Section.create(:name => "A")
sA.answers = [
Answer.create(:number => 1, :description=> "Prejudice"), 
Answer.create(:number => 2, :description=> "Academic Detachment"), 
Answer.create(:number => 3, :description=> "Drawing the Line"), 
Answer.create(:number => 4, :description=> "Not Drawing the Line"), 
Answer.create(:number => 5, :description=> "Conservatism, Radicalism, Moderatism"), 
Answer.create(:number => 6, :description=> "Rationalization"), 
Answer.create(:number => 7, :description=> "Wishful Thinking"),
Answer.create(:number => 8, :description=> "Tabloid Thinking"),  
Answer.create(:number => 9, :description=> "Causal Oversimplification"), 
Answer.create(:number => 10, :description=> "Inconceivability"),
Answer.create(:number => 0, :description=> "No Technique")
]
sA.save!
sB = Section.create(:name => "B")
sB.answers = [
Answer.create(:number => 1, :description=> "Emotional Terms"), 
Answer.create(:number => 2, :description=> "Metaphor and Simile"), 
Answer.create(:number => 3, :description=> "Emphasis"), 
Answer.create(:number => 4, :description=> "Quotation Out of Context"), 
Answer.create(:number => 5, :description=> "Abstract Terms"), 
Answer.create(:number => 6, :description=> "Vagueness"), 
Answer.create(:number => 7, :description=> "Ambiguity"),
Answer.create(:number => 8, :description=> "Shift of Meaning"),
Answer.create(:number => 0, :description=> "No Technique")
]
sB.save!
sC = Section.create(:name => "C")
sC.answers = [
Answer.create(:number => 1, :description=> "Appearance"), 
Answer.create(:number => 2, :description=> "Manner"), 
Answer.create(:number => 3, :description=> "Degrees and Titles"), 
Answer.create(:number => 4, :description=> "Numbers"), 
Answer.create(:number => 5, :description=> "Status"), 
Answer.create(:number => 6, :description=> "Repetition"), 
Answer.create(:number => 7, :description=> "Slogans"),
Answer.create(:number => 8, :description=> "Technical Jargon"),  
Answer.create(:number => 9, :description=> "Sophistical Formula"),
Answer.create(:number => 0, :description=> "No Technique")
]
sC.save!
sD = Section.create(:name => "D")
sD.answers = [
Answer.create(:number => 1, :description=> "Appeal to Pity"), 
Answer.create(:number => 2, :description=> "Appeal to Flattery"), 
Answer.create(:number => 3, :description=> "Appeal to Ridicule"), 
Answer.create(:number => 4, :description=> "Appeal to Prestige"), 
Answer.create(:number => 5, :description=> "Appeal to Prejudice"), 
Answer.create(:number => 6, :description=> "Bargain Appeal"), 
Answer.create(:number => 7, :description=> "Folksy Appeal"),
Answer.create(:number => 8, :description=> "Join the Bandwagon Appeal"),  
Answer.create(:number => 9, :description=> "Appeal to Practical Consequences"), 
Answer.create(:number => 10, :description=> "Passing from the Acceptable to the Dubious"),
Answer.create(:number => 0, :description=> "No Technique")
]
sD.save!
sE = Section.create(:name => "E")
sE.answers = [
Answer.create(:number => 1, :description=> "Concurrency"), 
Answer.create(:number => 2, :description=> "Post Hoc"), 
Answer.create(:number => 3, :description=> "Selected Instances"), 
Answer.create(:number => 4, :description=> "Hasty Generalization"), 
Answer.create(:number => 5, :description=> "Faulty Analogy"), 
Answer.create(:number => 6, :description=> "Composition"), 
Answer.create(:number => 7, :description=> "Division"),
Answer.create(:number => 8, :description=> "Non Sequitur"),
Answer.create(:number => 0, :description=> "No Technique")
]
sE.save!
sF = Section.create(:name => "F")
sF.answers = [
Answer.create(:number => 1, :description=> "Diversion"), 
Answer.create(:number => 2, :description=> "Disproving a Minor Point"), 
Answer.create(:number => 3, :description=> "Ad Hominem"), 
Answer.create(:number => 4, :description=> "Appeal to Ignorance"), 
Answer.create(:number => 5, :description=> "Leading Question"), 
Answer.create(:number => 6, :description=> "Complex Question"), 
Answer.create(:number => 7, :description=> "Inconsequent Argument"),
Answer.create(:number => 8, :description=> "Attacking a Straw Man"),  
Answer.create(:number => 9, :description=> "Victory by Definition"), 
Answer.create(:number => 10, :description=> "Begging the Question"),
Answer.create(:number => 0, :description=> "No Technique")
]
sF.save!