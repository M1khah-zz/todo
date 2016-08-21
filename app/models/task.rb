class Task < ActiveRecord::Base
  belongs_to :list
  validates :content, presence: true
  default_scope { order('position ASC')}
end
