require 'engtagger'

module ApplicationHelper
  
  def to_fudd(text)
    text.gsub("l", "w").gsub("r", "w").gsub("th", "d").gsub("L", "W").gsub("R", "W").gsub("Th", "D")
  end
  def random_pirate_exclamation
    exclamations = ["Avast!", "Shiver me timbers!", "Blow me down!", "Blimey!"]
    index = rand(0..exclamations.length-1)
    exclamations[index]
  end
  def to_arrr(text)
    text.gsub("er", "arrr").gsub("ar", "arrr").gsub("aur", "arrr").gsub("Er", "Arrr").gsub("Ar", "Arrr").gsub("Aur", "Arrr")
  end
  def to_pirate(text)
    tagger = EngTagger.new
    #diagram text by parts of speech
    diagrammed_text = tagger.get_readable(text)
    #split text into words
    words = diagrammed_text.split
    phrase_array = []
    words.each do |word|
      if (word.include? "/V")&&(word!="is/VBZ")&&(word!="Is/VBZ") #verb excluding reserved pirate verb 'is'
        #split up word + extra
        word_split = word.split("/")
        word = word_split[0]
        part_of_speech = word_split[1]
        word = random_pirate_verb(part_of_speech)
      elsif word.include? "/JJ" || "/RB" #adjective or adverb
        word = random_pirate_adjective
      else
        #strip verbage
        word_split = word.split("/")
        word = word_split[0]
        if word != pirate_subs(word) #reserved pirate word
          word = pirate_subs(word)
        else
          word = to_arrr(word)
        end  
      end
      phrase_array << word
    end
    #join phrase_array
    phrase_array.join(" ").gsub(" ,", ",").gsub(" .", ".")
  end

  def pirate_subs(word)
    #there, their, they're => thar
    #is => be
    #you => ye
    #yes => aye
    #my => me
    #of => o'
    #your => yer
    word = word.gsub("there", "thar").gsub("their", "thar").gsub("they're", "thar")
    word = word.gsub("There", "Thar").gsub("Their", "Thar").gsub("They're", "Thar")
    word = word.gsub("is", "be").gsub("Is", "Be")
    word = word.gsub("you", "ye").gsub("You", "Ye")
    word = word.gsub("your", "yer").gsub("you're", "yer").gsub("Your", "Yer").gsub("You're", "Yer")
    word = word.gsub("of", "o'").gsub("Of", "O'")
    word = word.gsub("my", "me").gsub("My", "Me")
    word
  end

  def random_pirate_adjective
    adjectives = ["swarthy", "smarmy", "tetchy", "lily-livered", "scurvy", "squiffy", "salty"]
    index = rand(0..adjectives.length-1)
    adjectives[index]
  end
  def random_pirate_verb(tag)
    if tag == "VB" || tag == "VBP"
      verbs = ["swashbuckle", "plunder", "swab", "blether", "careen", "maroon"]
      index = rand(0..verbs.length-1)
      verbs[index]
    elsif tag == "VBG"
      verbs = ["swashbuckling", "plundering", "swabbing", "blethering", "careening", "marooning"]
      index = rand(0..verbs.length-1)
      verbs[index]
    elsif tag == "VBZ"
      verbs = ["swashbuckles", "plunders", "swabs", "blethers", "careens", "maroons"]
      index = rand(0..verbs.length-1)
      verbs[index]
    elsif tag == "VBN"
      verbs = ["swashbuckled", "plundered", "swabbed", "blethered", "careened", "marooned"]
      index = rand(0..verbs.length-1)
      verbs[index]
    else
      "error"
    end
  end

end
