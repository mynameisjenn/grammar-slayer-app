
Word.destroy_all

file = File.read('word_list.json')
data_hash = JSON.parse(file)

data_hash.each do |content, word_types|
  create_word_hash = {}

  create_word_hash["content"] = content
  create_word_hash["noun"] = word_types.include?("noun") || word_types.include?("noun-plural") 
  create_word_hash["verb"] = word_types.include?("verb") || word_types.include?("verb-intransitive") || word_types.include?("verb-transitive")
  create_word_hash["adjective"] = word_types.include?("adjective")
  create_word_hash["preposition"] = word_types.include?("preposition")
  create_word_hash["adverb"] = word_types.include?("adverb")
  create_word_hash["conjunction"] = word_types.include?("conjunction")
  create_word_hash["article"] = word_types.include?("indefinite-article") || word_types.include?("definite-article")
  create_word_hash["pronoun"] = word_types.include?("pronoun")

  Word.create(create_word_hash)
end