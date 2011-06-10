require 'httparty'
require 'json'
require 'eventmachine'
require 'em/buftok'
require 'uri'
require 'simple_oauth'

require 'gnip'
require 'gnip/json_stream'
require 'gnip/rules'

module Gnip
  RULES_URI = "https://%s.gnip.com/data_collectors/%s/rules.json"
  STREAM_URI = "https://%s.gnip.com/data_collectors/%s/track.json"
end