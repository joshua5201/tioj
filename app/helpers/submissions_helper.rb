module SubmissionsHelper
  def censored(s)
    return false if user_signed_in? and current_user.admin?
    return false if user_signed_in? and current_user.id == s.user_id
    if s.contest && Time.now >= s.contest.start_time && Time.now <= s.contest.end_time
      return true if not user_signed_in?
      return true if user_signed_in? and current_user.id != s.user_id
    end
    return false
  end

  def language_class(lang)
    case lang
    when "c++11", "c++"
      return "language-cpp"
    when "c"
      return "language-c"
    when "haskell"
      return "language-haskell"
    else
      return "language-clike"
    end
  end
end
