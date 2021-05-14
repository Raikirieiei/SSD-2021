class Admins::ProductsController < ApplicationController
  before_action :authenticate_admin!,only: [:admin,:create,:edit,:destroy]
  def index
    @search = params[:search]

    @products = Product.all
    @products = @products
      .where("title LIKE ? or body LIKE ?", "%#{@search}%", "%#{@search}%") if @search.present?
    @products = @products.page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.csv { send_data generate_csv(Product.all), file_name: 'products.csv' }
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admins_products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end


  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: :index
  end

  def delete_cover_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to action: :index
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to action: :index
  end

  def csv_upload
    data = params[:csv_file].read.split("\n")
    data.each do |line|
      attr = line.split(",").map(&:strip)
      Product.create title: attr[0], body: attr[1]
    end
    redirect_to action: :index
  end

  private

  def generate_csv(products)
    products.map { |a| [a.title, a.body, a.created_at.to_date].join(',') }.join("\n")
  end

  def product_params
    params.require(:product).permit(:title, :status, :cover_image, :body, :stock, :server, images: [])
  end
end