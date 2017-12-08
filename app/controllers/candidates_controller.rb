class CandidatesController < ApplicationController

  before_action :find_candidate, only:[:show, :edit, :update, :destroy, :vote]

#  include CandidatesHelper  (讓CandidatesHelper模組用include方法加入)

  def index
#    show_your_age(18)
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def show

  end

  def create
    #create a new candidate
    @candidate = Candidate.new(clean_params)

    if @candidate.save
      redirect_to candidates_path, notice: "Candidate was created successfully!"
    else
      render "new" #go to new.html.erb
    end
  end

  def edit

  end

  def update
    #edit candidate
    if @candidate.update(clean_params)
      redirect_to candidates_path, notice: "Candidate was updated successfully!"
    else
      render "edit" #go to edit.html.erb
    end
  end

  def destroy
    #destroy candidate
    @candidate.destroy
    redirect_to candidates_path, notice: "Candidate was destroied successfully!"
  end

  def vote
    # @candidate.update(counter: @candidate.counter + 1)
    # @candidate.increment!(:counter)

    @candidate.vote_logs.create(ip_address: request.remote_ip) #（從候選人角度，建立投票紀錄並記錄投票者ip）
    
    # VoteLog.create(ip_address: "123", candidate_id: 123) (從投票者觀點做，新增VoteLog內容有ip跟投票對象)
    redirect_to candidates_path, notice: "Voted!"
  end

  private
  def clean_params
    # Strong Parameters(require抓取candidate有關的，name party age欄位)
    params.require( :candidate ).permit(:name, :party, :age, :comment)
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
