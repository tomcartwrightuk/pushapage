class SiteReference < ActiveRecord::Base
belongs_to :user
require 'uri'

  def self.get_host
    uri = URI.parse(self)
    uri = URI.parse("http://#{self}") if uri.scheme.nil?
    host = uri.host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end

end

