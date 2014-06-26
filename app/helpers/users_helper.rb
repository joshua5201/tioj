module UsersHelper
  def user_ac_count(user)
    return Submission.select("problem_id").distinct.where("user_id = ? AND result = ?", user.id, "AC").count
  end
end
