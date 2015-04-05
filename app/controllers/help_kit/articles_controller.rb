require_dependency "help_kit/application_controller"
module HelpKit
  class ArticlesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :not_found
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    before_action :check_authorization,
      only: [ :new, :create, :edit, :update, :destroy]

    layout 'help_kit/minimal'


    def index_category
      @category = Category.friendly.find(params[:category])
      @articles = Article.for_category(@category)
    end

    def search
      @articles = Article.search(params[:search][:query])
    end

    def show; end

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

    def edit; end

    def update
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    end

    def destroy
      if @article.destroy
        flash[:success] = "Article deleted."
        redirect_to admin_landing_path
      end
    end

    private

    def not_found
      @article = Article.new(title: params[:title])
      render 'not_found'
    end

    def set_article
      @article = Article.friendly.find(params[:id])
    end

    def article_params
      params.require(:article).permit(
        :title,
        :content,
        :category_id,
        :description
      )
    end

    def check_authorization
      unless is_authorized?
        redirect_to article_path(Article.friendly.find(params[:id]))
        return false
      end
    end

  end
end
