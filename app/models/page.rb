class Page < ApplicationRecord
  def to_param
    "#{id}-#{title.parameterize.downcase}"
  end
end
