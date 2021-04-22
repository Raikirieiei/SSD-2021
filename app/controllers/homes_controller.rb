class HomesController < ApplicationController
    
    def index

        @search = params[:search]

        @products = Product.all
        @products = @products
          .where("title LIKE ? or body LIKE ?", "%#{@search}%", "%#{@search}%") if @search.present?
        @products = @products.page(params[:page]).per(20)

    end

    def show
      @product = Product.find(params[:id])
    end


  

end