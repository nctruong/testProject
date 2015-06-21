class Video < ActiveRecord::Base
  searchkick autocomplete: ['title']
  has_drafts
end
