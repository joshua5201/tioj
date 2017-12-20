module UsersHelper
  def ac_ratio_by_user(user)
    all = user.submissions.where("contest_id is NULL").select("result")
    ac = all.where("result = ?", "AC")
    all = all.count
    ac = ac.count
    ratio = "%.1f%%" % (100.0 * ac / all)
    ac_page = link_to ac, submissions_path(:filter_user_id => user.id, :'filter_status[]' => "AC")
    all_page = link_to all, submissions_path(:filter_user_id => user.id)
    return raw ( ratio + " (" + ac_page + "/" + all_page + ")" )
  end

  def ac_ratio_by_user_sub_acsub(user, all, ac)
    ratio = "%.1f%%" % (100.0 * ac / all)
    ac_page = link_to ac, submissions_path(:filter_user_id => user.id, :'filter_status[]' => "AC")
    all_page = link_to all, submissions_path(:filter_user_id => user.id)
    return raw ( ratio + " (" + ac_page + "/" + all_page + ")" )
  end
  
  def user_problem_ac(user, problem)
    return Submission.exists?(["contest_id is NULL AND user_id = ? AND problem_id = ? AND result = ?", user.id, problem.id, "AC"])
    if Submission.where("contest_id is NULL AND user_id = ? AND problem_id = ? AND result = ?", user.id, problem.id, "AC").count == 0
      return false
    else
      return true
    end
  end
  
  def user_problem_tried(user, problem)
    return Submission.exists?(["contest_id is NULL AND user_id = ? AND problem_id = ?", user.id, problem.id])
    if Submission.where("contest_id is NULL AND user_id = ? AND problem_id = ?", user.id, problem.id).count == 0
      return false
    else
      return true
    end
  end
  
end
