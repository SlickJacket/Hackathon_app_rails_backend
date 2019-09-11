class Api::V1::UserSkillsController < ApplicationController
  skip_before_action :authorized
  before_action :set_user_skill, only: [:show, :update, :destroy]

  def index
    @user_skills = UserSkill.all

    render json: @user_skills
  end

  def show
    render json: @user_skill
  end

  def create
    @user_skill = UserSkill.new(user_skill_params)

    if @user_skill.save
      render json: @user_skill, status: :created, location: @user_skill
    else
      render json: @user_skill.errors, status: :unprocessable_entity
    end
  end

  def update
    if @user_skill.update(user_skill_params)
      render json: @user_skill
    else
      render json: @user_skill.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_skill.destroy
  end

  private
    def set_user_skill
      @user_skill = UserSkill.find(params[:id])
    end

    def user_skill_params
      params.require(:user_skill).permit(:user_id, :skill_id)
    end
end
