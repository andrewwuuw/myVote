class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def show
    find_candidate
  end

  def create
    #create a new candidate
    @candidate = Candidate.new(clean_params)

    if @candidate.save
      redirect_to candidates_path
    else
      render "new" #go to new.html.erb
    end
  end

  def edit
    find_candidate
  end

  def update
    #edit candidate
    find_candidate

    if @candidate.update(clean_params)
      redirect_to candidates_path
    else
      render "edit" #go to edit.html.erb
    end
  end

  def destroy
    #destroy candidate
    find_candidate
    
    @candidate.destroy
    redirect_to candidates_path
  end

  private
  def clean_params
    # Strong Parameters(require抓取candidate有關的，name party age欄位)
    params.require(:candidate).permit(:name, :party, :age)
  end

  def find_candidate
    @candidate = Candidate.find_by(id: params[:id])
  end
end
