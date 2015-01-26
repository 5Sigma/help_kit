require_dependency "help_kit/application_controller"

module HelpKit
  class ArticlesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :not_found
    before_action :set_article, only: [:show, :edit, :update]

    def show
      if @article
        render 'show'
      else
        @article = Article.new({title: params[:title]})
        render 'new'
      end
    end

    def new
      @article = Article.new(title: params[:title])
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to @article
      else
        render 'new'
      end
    end

    def edit
      render 'edit'
    end

    def update
      if @article.save
        redirect_to @article
      else
        render 'edit'
      end
    end

    private

    def not_found
      render 'not_found'
    end

    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(
        :title,
        :content
      )
    end

  end
end
