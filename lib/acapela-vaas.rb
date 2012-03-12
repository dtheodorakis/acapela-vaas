require "acapela-vaas/version"
module Acapela
  module Vaas
    @@credentials = {}
    @@config = {
      uri: URI.parse("http://vaas.acapela-group.com/Services/Synthesizer"),
      speaker: "heather22k"
    }
    def self.credentials
      @@credentials
    end
    def self.credentials=(params)
      params.keys.each{|k| raise(ArgumentError, 
        "Argument #{k} is not accepted") unless [:login, :password, :app].member?(k)}
      @@credentials = params
    end
    def self.say(*args)
      options = args.extract_options!
      options = {speaker: @@config[:speaker]}.merge(options)
      params = {
      	prot_vers: 2,
      	cl_env: "Ruby acapela-vaas #{VERSION}",
      	cl_login: @@credentials[:login],
      	cl_app: @@credentials[:app],
      	cl_pwd: @@credentials[:password],
      }
      if options[:sound_id].blank?
        params.merge!({
          req_voice: options[:speaker],
        	req_text: args[0]
        })
      else
        params.merge!({
          req_type: "GET",
        	req_snd_id: options[:sound_id]
        })
      end
      response = Net::HTTP.post_form(@@config[:uri], params)
      Sound.new(CGI::parse(response.body))
    end
    class Sound
      def initialize(response)
        @url = response["snd_url"].first
        @sound_id = response["snd_id"].first
        @time = response["snd_time"].first
        @size = response["snd_size"].first
      end
      def size
        @size
      end
      def sound_id
        @sound_id
      end
      def time
        @time
      end
      def url
        @url
      end
    end
  end
end
