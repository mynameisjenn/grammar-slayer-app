class Api::WordsController < ApplicationController
  
  def index

    level = params[:level].to_i

    @words =  Word.where(noun: true).sample(10)
    @words += Word.where(verb: true).sample(10)
    @words += Word.where(adjective: true).sample(10)

    @word_types = ["noun", "verb", "adjective"]

    if level >= 2
      @words += Word.where(pronoun: true).sample(10)
      @word_types << "pronoun"
    end

    if level >= 3
      @words += Word.where(preposition: true).sample(10) 
      @word_types << "preposition"
    end

    if level >= 4
      @words += Word.where(conjunction: true).sample(10)
      @word_types << "conjunction" 
    end

    if level >= 5
      @words += Word.where(adverb: true).sample(10)
      @word_types << "adverb"
    end      

    if level >= 6
      @words += Word.where(article: true).sample(3)
      @word_types << "article"
    end

    render 'index.json.jbuilder'
  end

  def show
    word_id = params[:id]
    @word = Word.find(word_id)
    render 'show.json.jbuilder'
  end

  def create
    @word = Word.new(
                        content: params[:content],
                        noun: params[:noun], 
                        verb: params[:verb],
                        adjective: params[:adjective],
                        pronoun: params[:pronoun],
                        preposition: params[:preposition],
                        article: params[:article],
                        conjunction: params[:conjunction],
                        adverb: params[:adverb]

                        )
    @word.save
    render 'show.json.jbuilder'
  end

  def update
    word_id = params[:id]
    @word = Word.find(word_id)

    @word.content = params[:content] || @word.content
    @word.noun = params[:noun] || @word.noun
    @word.verb = params[:verb] || @word.verb
    @word.adjective = params[:adjective] || @word.adjective
    @word.pronoun = params[:pronoun] || @word.pronoun
    @word.article = params[:article] || @word.article
    @word.conjunction = params[:conjunction] || @word.conjunction
    @word.verb = params[:verb] || @word.verb

    @word.save
    render 'show.json.jbuilder'
  end

  def destroy
    word_id = params[:id]
    @word = Word.find_by(word_id)
    @word.destroy
    render json:{message: "Successfully deleted word from word bank."}
  end
end
