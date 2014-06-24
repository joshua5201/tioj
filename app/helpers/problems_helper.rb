module ProblemsHelper
  def users_ac_ratio(problem)
    all = User.joins(:submissions).uniq.where("submissions.problem_id = ?", problem.id)
    ac = all.where("submissions.result = ?", "AC")
    all = all.size
    ac = ac.size
    ratio = "%.1f%%" % (100.0 * ac / all)
    ranklist_page = link_to ac.to_s + "/" + all.to_s, problems_ranklist_path(problem.id)
    return raw ( ratio + " (" + ranklist_page + ")" )
  end
  
  def submissions_ac_ratio(problem)
    all = Submission.where("problem_id = ?", problem.id)
    ac = all.where("result = ?", "AC")
    all = all.size
    ac = ac.size
    ratio = "%.1f%%" % (100.0 * ac / all)
    ac_page = link_to ac, :controller => :submissions, :action => :index, :problem_id => problem.id, :qresult => "AC"
    all_page = link_to all, problem_submissions_path(problem.id)
    return raw ( ratio + " (" + ac_page + "/" + all_page + ")" )
  end
end
