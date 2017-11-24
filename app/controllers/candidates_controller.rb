class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def show
    @candidate = Candidate.find_by(id: params[:id])
  end

  def create
    # Strong Parameters(require抓取candidate有關的，name party age欄位)
    clean_params = params.require(:candidate).permit(:name, :party, :age)
    @candidate = Candidate.new(clean_params)

    if @candidate.save
      redirect_to candidates_path
    else
      render "new" #go to new.html.erb
    end
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    clean_params = params.require(:candidate).permit(:name, :party, :age)
    @candidate = Candidate.find_by(id: params[:id])

    if @candidate.update(clean_params)
      redirect_to candidates_path
    else
      render "edit" #go to edit.html.erb
    end
  end

  def destroy
    @candidate = Candidate.find_by(id: params[:id])
    @candidate.destroy
    redirect_to candidates_path
  end

end
