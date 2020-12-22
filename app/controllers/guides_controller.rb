class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :update, :destroy]
  before_action :authorize_request, only: [:create, :update, :destroy] 
  before_action :set_user_comment, only: [:update, :destroy]

  # GET /guides
  def index
    @guides = Guide.all

    render json: @guides
  end

  def new
    @comment = Comment.new(guide_id: params[:guide_id])
  end
  
  # GET /guides/1
  def show
    render json: @guide, include: :user
  end

  # POST /guides
  def create
    @guide = Guide.new(guide_params)
    @comment.user = @current_user

    if @guide.save
      render json: @guide, status: :created, location: @guide
    else
      render json: @guide.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guides/1
  def update
    if @guide.update(guide_params)
      render json: @guide
    else
      render json: @guide.errors, status: :unprocessable_entity
    end
  end

  # DELETE /guides/1
  def destroy
    @guide.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    def set_user_guide
      @guide = @current_user.guides.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def guide_params
      params.require(:guide).permit(:user_id, :title, :content, :champion)
    end
end
