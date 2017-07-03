class VoteDecanter < Decanter::Base
  input :votable_id, :integer
  input :votable_type, :integer
  input :user, :id
end
