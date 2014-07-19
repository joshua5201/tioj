module ArticlesHelper
  def school_year(era)
    if not era.blank? 
      return era
    end
    t = Time.now
    if t.month < 7 
      return t.year - 1
    else
      return t.year
    end
  end
end
