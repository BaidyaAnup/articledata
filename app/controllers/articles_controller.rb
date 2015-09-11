class ArticlesController < ApplicationController
	#before_action :set_article, only: [:edit, :update, :destroy]

  # GET /products
  

  def index
  @article = Article.all
  end

  # GET /products/1
  # GET /products/1.json
  #def show
  #end

  # GET /products/new
  def show
  @article=Article.find(params[:id])
 end

  def new
    @article = Article.new
  end

  # GET /products/1/edit
  def edit
     @article = Article.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    #render :text => params[:article].to_yaml and return
    @article = Article.new(article_params)
    mod_interest = params["article"]["interest"].join(",") if params["article"]["interest"].present?
    @article.interest= mod_interest
      if @article.save
        redirect_to action: :index
      else
       render 'new'
    end
end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update

    @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to action: :index
  else
    render 'edit'
      end
    end
  

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
      @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    #def set_article
      #@article = Article.find(params[article_params])
    #end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params

      params.require(:article).permit(:firstname, :lastname, :email,:address, :gender,:city, :state, :country,:interest)
    end
end

