class Admins::ConnectCategoriesController < ApplicationController
    before_action :authenticate_admin!
    def create
        @categories = Category.find params[:category_id]
        product = Product.find_by(body: connect_category_params[:result])
        @categories.connect_categories.create(product: product )
        redirect_to admins_categories_path
    end
    
    private
    
    def connect_category_params
        params.require(:connect_category).permit(:result)
    end
end
