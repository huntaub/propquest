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
Answer.create(:number => 10, :description=> "Inconceivability") 
]
sB = Section.create(:name => "B")
sB.answers = [
Answer.create(:number => 1, :description=> "Emotional Terms"), 
Answer.create(:number => 2, :description=> "Metaphor and Similie"), 
Answer.create(:number => 3, :description=> "Emphasis"), 
Answer.create(:number => 4, :description=> "Quotation Out of Context"), 
Answer.create(:number => 5, :description=> "Abstract Terms"), 
Answer.create(:number => 6, :description=> "Vagueness"), 
Answer.create(:number => 7, :description=> "Ambiguity"),
Answer.create(:number => 8, :description=> "Shift of Meaning")
]
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
Answer.create(:number => 9, :description=> "Sophistical Formula")
]