module FreegeoipUtils

  def get_visitor_details(ip)
  	url = "http://freegeoip.net/json/" + ip
  	response = HTTParty.get(url)
  	response.body
  end
end

