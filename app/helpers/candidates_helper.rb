module CandidatesHelper
  def show_your_age(age)
    if age >= 18
      "YES"
    else
      "NO"
    end
  end
end
