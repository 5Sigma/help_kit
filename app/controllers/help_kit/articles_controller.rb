require_dependency "help_kit/application_controller"

module HelpKit
  class ArticlesController < ApplicationController
    before_action :set_article

    def show
      if @article
        render 'show'
      else
        @article = Article.new
        render 'create'
      end
    end

    def edit
      if @article
        render 'edit'
      else
        @article = Article.new
        render 'create'
      end
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
      @article = Article.find_by_title(params[:title])
    end

    def article_params
      params.require(:article).permit(
        :title,
        :content
      )
    end

  end
end
