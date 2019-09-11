class Api::V1::SkillsController < ApplicationController
  skip_before_action :authorized
  before_action :set_skill, only: [:show, :update, :destroy]

  def index
    @skills = Skill.all

    render json: @skills
  end

  def show
    render json: @skill
  end

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      render json: @skill, status: :created, location: @skill
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  def update
    if @skill.update(skill_params)
      render json: @skill
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.destroy
  end

  private
    def set_skill
      @skill = Skill.find(params[:id])
    end
    
    def skill_params
      params.require(:skill).permit(:name)
    end
end
