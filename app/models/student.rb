class Student < ApplicationRecord
  default_scope { where.not(:is_deleted => true) }

  def as_json(opts = {})
    if opts[:only].nil? && opts[:except].nil? && opts[:methods].nil?
      super(except: [:created_at, :updated_at ])
    else
      super(opts)
    end
  end

end
