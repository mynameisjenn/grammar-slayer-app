json.word_types @word_types

json.words do  
  json.array! @words.each do |word|
    json.id word.id
    json.content word.content
    json.part_of_speech do 
        json.noun word.noun
        json.verb word.verb
        json.adjective word.adjective
        json.pronoun word.pronoun
        json.preposition word.preposition
        json.article word.article
        json.conjunction word.conjunction
        json.adverb word.adverb
    end
  end
end