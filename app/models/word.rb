class Word < ApplicationRecord
  def prompts
    collection = []
    list = [
            "noun",
            "adjective",
            "verb",
            "pronoun",
            "preposition",
            "article",
            "conjunction",
            "adverb"
          ]

    list.each { |prompt| eval("collection << prompt if #{prompt}") }
    collection
  end

end
