module CandidatesHelper
  def show_your_age(age)
    if age >= 18
      "YES"
    else
      "NO"
    end
  end

  def show_vote(candidate)
    count = candidate.vote_logs.size
    if count > 30
      "<b style='color: green;'>#{count}</b>".html_safe
    else
      "<b style='color: red;'>#{count}</b>".html_safe
    end
  end

  def show_party(party)
    case party
    when "KMT"
      "<a style='color: blue;'>#{party}</a>".html_safe
    when "DPP"
      "<a style='color: green;'>#{party}</a>".html_safe
    else
      party
    end
  end
end
