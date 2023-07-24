class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  require "nokogiri"
  require "open-uri"

  # GET /recipes or /recipes.json
  def index
    # @recipes = Recipe.all
    @recipes = policy_scope(Recipe)

    ingredient = "pine nuts"
    url = "https://www.youtube.com/results?search_query=#{ingredient}"

    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML.parse(html_file)

    @recipe_titles = []
    @recipe_urls = []

    html_doc.search(".card__section.card__content").each do |element|
      @recipe_titles << element.search(".style-scope.ytd-video-renderer").text.strip
      # @recipe_titles << element.text.strip
      # @recipe_urls << element.search(".link").attribute("href").value
      # raise
    end
  end

  # GET /recipes/1 or /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully created." }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.fetch(:recipe, {})
    end
end
