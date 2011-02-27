class Click < ActiveRecord::Base
  validates_presence_of :url, :request_ip
end
