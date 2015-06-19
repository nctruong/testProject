class Video < ActiveRecord::Base
  searchkick autocomplete: ['title']
end
