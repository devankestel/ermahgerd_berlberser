module ApplicationHelper
  
  def to_fudd(text)
    text.gsub("l", "w").gsub("r", "w").gsub("th", "d").gsub("L", "W").gsub("R", "W").gsub("Th", "D")
  end
  def random_pirate_exclamation
    exclamations = ["Avast!", "Shiver me timbers!", "Blow me down!", "Blimey!"]
    index = rand(0..exclamations.length)
    exclamations[index]
  end
  def to_arrr(text)
    text.gsub("er", "arrr").gsub("ar", "arrr").gsub("aur", "arrr").gsub("Er", "Arrr").gsub("Ar", "Arrr").gsub("Aur", "Arrr")
  end
  def pirate_direct(text)
    #split text into words
    #iterate through words and chain a series of gsubs
    #take returned array and combine back into string

    #there, their, they're => thar
    #is => be
    #you => ye
    #yes => aye
    #my => me
    #of => o'
    #your => yer
  end
  def random_pirate_adjective
    adjectives = ["swarthy", "smarmy", "tetchy", "lily-livered", "scurvy", "squiffy", "salty"]
    index = rand(0..adjectives.length)
    adjectives[index]
  end
  def random_pirate_verb(tag)
    if tag == "VB" || tag == "VBP"
      verbs = ["swashbuckle", "plunder", "swab", "blether", "careen", "maroon"]
      index = rand(0..verbs.length)
      verbs[index]
    elsif tag == "VBG"
      verbs = ["swashbuckling", "plundering", "swabbing", "blethering", "careening", "marooning"]
      index = rand(0..verbs.length)
      verbs[index]
    elsif tag == "VBZ"
      verbs = ["swashbuckles", "plunders", "swabs", "blethers", "careens", "maroons"]
      index = rand(0..verbs.length)
      verbs[index]
    elsif tag == "VBN"
      verbs = ["swashbuckled", "plundered", "swabbed", "blethered", "careened", "marooned"]
      index = rand(0..verbs.length)
      verbs[index]
    else
      "error"
    end
  end

end
