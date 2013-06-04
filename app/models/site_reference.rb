class SiteReference < ActiveRecord::Base
  belongs_to :user
  require 'uri'
  validates :reference, :length => { :minimum => 4 }

  def get_host
    uri = URI.parse(self.reference)
    uri = URI.parse("http://#{self.reference}") if uri.scheme.nil?
    host = uri.host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end

end

