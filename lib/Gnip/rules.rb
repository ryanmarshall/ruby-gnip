require 'httparty'
require 'json'
# This is a client for accessing Gnip's REST APIs
# for full documentation see:
# http://docs.gnip.com/w/page/23724581/Gnip-Full-Documentation

module Gnip

  class Rules
    include HTTParty

    RULES_URI = "https://%s.gnip.com/data_collectors/%s/rules.json"

    DEFAULT_OPTIONS = { :query => {} }

    #
    # gnip_options = {
    #   :username  => Gnip Username
    #   :password  => Gnip Password
    #   :collector => Collector ID of the stream
    #   :box       => Gnip Box Name (in the gnip url)
    # }
    #
    def initialize(gnip_options = {}, http_query = {})
      @options = DEFAULT_OPTIONS
      @options[:query] = http_query
      @options[:basic_auth] = {:username => gnip_options[:username], :password => gnip_options[:password]} \
        if gnip_options.keys.include?(:username) && gnip_options.keys.include?(:password)
      @box = gnip_options[:box]
      @collector = gnip_options[:collector]
    end

    def list
      @result_hash = {}
      result = self.class.get(url, @options)
      result.parsed_response['rules'].collect do |h|
        {
          'tag' => h['tag'].nil? ? h['value'] : h['tag'],
          'value' => h['value']
         }
      end.each{|h| @result_hash[h['tag']] = h['value'] }
    @result_hash
    end

    def add(terms = {})
      @options[:body] = build_gnip_hash terms
      self.class.post(url, @options).parsed_response
    end

    def remove(terms = {})
      @options[:body] =  build_gnip_hash terms
      self.class.delete(url, @options).parsed_response
    end

    private
      def url
        RULES_URI % [@box, @collector]
      end

      def build_gnip_hash(terms = {})
        {
          'rules' => terms.collect { |k,v|
            {'value' => v.gsub(/[^0-9A-Za-z ]/, ''), 'tag' => k}
          }
        }.to_json
      end
  end
end