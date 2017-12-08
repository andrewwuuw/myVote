class Candidate < ApplicationRecord
  validates :name, presence: true

  has_many :vote_logs
  # c = Candidate.first(抓一號候選人)
  # c.vote_logs（查詢表格vote_logs）
end
