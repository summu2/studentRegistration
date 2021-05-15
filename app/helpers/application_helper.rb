module ApplicationHelper

  def self.is_blank(params)
    is_blank=false
    if params === false
      return is_blank
    end
    if params.nil? || params.blank?
      is_blank= true
    end
    if (params.kind_of? Array) && params.length == 0
      is_blank= true
    end
    return is_blank
  end
end
