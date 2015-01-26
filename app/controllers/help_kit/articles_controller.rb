require_dependency "help_kit/application_controller"

module HelpKit
  class ArticlesController < ApplicationController
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
      @article = Article.new
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
