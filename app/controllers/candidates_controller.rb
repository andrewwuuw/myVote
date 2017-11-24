class CandidatesController < ApplicationController
  def index
    @candidate = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def create
    # Strong Parameters(require抓取candidate有關的，name party age欄位)
    clean_params = params.require(:candidate).permit(:name, :party, :age)
    candidate = Candidate.new(clean_params)

    if candidate.save
      redirect_to candidates_path
    else
      #...
    end
  end

end
