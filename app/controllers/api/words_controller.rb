class Api::WordsController < ApplicationController
  
  def index
    @words = Word.all
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
