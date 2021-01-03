class CandidatesController < ApplicationController
  before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]

  def index
    @candidates = Candidate.all
  end

  def show
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      redirect_to root_path, notice: '新增候選人成功'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to root_path, notice: '更新候選人成功'
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to root_path, notice: '刪除候選人成功'
  end

  def vote
    @candidate.votes = @candidate.votes + 1
    @candidate.save
    redirect_to root_path, notice: '投票成功'
  end

  private
  def candidate_params
    params.require(:candidate).permit(:name, :age, :party, :politics)
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
