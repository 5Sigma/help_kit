require_dependency "help_kit/application_controller"

module HelpKit
  class Admin::CategoriesController < ApplicationController
    layout 'help_kit/admin'
    before_action :set_category, only: [:show, :edit, :update, :destroy]

    before_action :check_authorization

    def index
      @categories = Category.roots
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        redirect_to admin_categories_path
      else
        render 'new'
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to admin_categories_path
      else
        render 'edit'
      end
    end

    def destroy
      @category.destroy
      redirect_to admin_categories_path
    end

    private

    def set_category
      @category = Category.friendly.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :parent_id, :header_content)
    end

    def check_authorization
      unless HelpKit.is_authorized?
        redirect_to landing_path
        return false
      end
    end
  end
end
