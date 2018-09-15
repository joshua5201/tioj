module ProblemsHelper
  def topcoder(problem)
    submission = problem.submissions.select("user_id").where("contest_id is NULL AND result = ? ", "AC").order("total_time ASC").order("total_memory ASC").order("LENGTH(code) ASC").first
    return User.find_by_id(submission.user_id) if submission
    return nil if submission.blank?
  end

  def users_ac_ratio(problem)
    all = problem.submissions.where("contest_id is NULL").select("MIN(result) as result").group("user_id").map{|a| a.result}
    ac = all.count{|a| a == "AC"}
    all = all.count
    ratio = "%.1f%%" % (100.0 * ac / all)
    ranklist_page = link_to ac.to_s + "/" + all.to_s, problem_ranklist_path(problem.id)
    return raw ( ratio + " (" + ranklist_page + ")" )
  end

  def topcoders(problems)
    problem_ids = problems.map(&:id)
    lst = Problem.select("problems.id, (select user_id from submissions where problem_id = problems.id and (contest_id is null and result = 'AC') order by total_time asc, total_memory asc, length(code) asc limit 1) topcoder").where(id: problem_ids).to_a
    topcoders = Hash[User.where(id: lst.map(&:topcoder).compact.uniq).to_a.collect { |user| [user.id, user] }]
    topcoders_mp = Hash[lst.collect { |prob| [prob.id, prob.topcoder ? topcoders[prob.topcoder] : nil] }]
    return topcoders_mp
  end

  def get_submissions_user(subs)
    return Hash[User.where(id: subs.map(&:user_id).uniq).to_a.collect { |user| [user.id, user] }]
  end

  def submissions_ac_ratio(problem)
    all = problem.submissions.where("contest_id is NULL").select("result")
    ac = all.where("result = ?", "AC")
    all = all.count
    ac = ac.count
    ratio = "%.1f%%" % (100.0 * ac / all)
    ac_page = link_to ac, :controller => :submissions, :action => :index, :problem_id => problem.id, :filter_status => "AC"
    all_page = link_to all, problem_submissions_path(problem.id)
    return raw ( ratio + " (" + ac_page + "/" + all_page + ")" )
  end

  def users_ac_ratio_with_infor(problem)
    all = problem.user_cnt
    ac = problem.user_ac
    ratio = "%.1f%%" % (100.0 * ac / all)
    ranklist_page = link_to ac.to_s + "/" + all.to_s, problem_ranklist_path(problem.id)
    return raw ( ratio + " (" + ranklist_page + ")" )
  end

  def submissions_ac_ratio_with_infor(problem)
    all = problem.sub_cnt
    ac = problem.sub_ac
    ratio = "%.1f%%" % (100.0 * ac / all)
    ac_page = link_to ac, :controller => :submissions, :action => :index, :problem_id => problem.id, :filter_status => "AC"
    all_page = link_to all, problem_submissions_path(problem.id)
    return raw ( ratio + " (" + ac_page + "/" + all_page + ")" )
  end
  
  def user_problem_status(user, problem)
    if user_problem_ac(user, problem)
      raw '<span class="text-success glyphicon glyphicon-ok"></span>'
    elsif user_problem_tried(user, problem)
      raw '<span class="text-danger glyphicon glyphicon-thumbs-down"></span>'
    else
      raw '<span class="text-muted glyphicon glyphicon-minus"></span>'
    end
  end

  def user_problem_status_with_infor(problem)
    if problem.cur_user_ac > 0
      raw '<span class="text-success glyphicon glyphicon-ok"></span>'
    elsif problem.cur_user_tried > 0
      raw '<span class="text-danger glyphicon glyphicon-thumbs-down"></span>'
    else
      raw '<span class="text-muted glyphicon glyphicon-minus"></span>'
    end
  end
  
end
