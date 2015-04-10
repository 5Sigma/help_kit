require_dependency "help_kit/application_controller"
module HelpKit
  class ArticlesController < ApplicationController

    rescue_from ActiveRecord::RecordNotFound, :with => :not_found
    before_action :set_article,
      only: [:show, :edit, :update, :destroy, :publish, :unpublish]

    before_action :check_authorization,
      only: [ :new, :create, :edit, :update, :destroy, :publish, :unpublish]

    layout 'help_kit/minimal'


    def index_category
      @category = Category.friendly.find(params[:category])
      @articles = Article.for_category(@category)
    end

    def search
      @articles = Article.search(params[:search][:query])
    end

    def show
      unless is_authorized?
        @article.view_count = 0 if @article.view_count == nil
        @article.update_column('view_count', @article.view_count + 1)
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

    def publish
      @article.publish!
      flash[:success] = "Article published. It will now be viewable."
      redirect_to article_path(@article)
    end

    def unpublish
      @article.unpublish!
      flash[:success] = "Article unpublished. This article will no longer be visible"
      redirect_to article_path(@article)
    end

    private

    def not_found
      @article = Article.new(title: params[:title])
      render 'not_found'
      return false
    end

    def set_article
      if is_authorized?
        @article = Article.unscoped.friendly.find(params[:id])
      else
        @article = Article.friendly.find(params[:id])
      end
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
