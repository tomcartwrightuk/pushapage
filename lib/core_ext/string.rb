class String
  def get_host
    uri = URI.parse(self)
    uri = URI.parse("http://#{self}") if uri.scheme.nil?
    host = uri.host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end
end
