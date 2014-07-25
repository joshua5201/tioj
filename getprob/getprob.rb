module Getprob
  require 'json'
  require 'open-uri'
  require 'net/http'

  class ProblemGetter
    def initialize(base_url = 'http://icpc.csie.org:9898/hello')
      @base_url = base_url
    end
    def get(*probs)
      probs = probs.each do |pid|
        res = JSON.parse(Net::HTTP.get(URI("#{@base_url}/#{pid}.json")))
        if not res.empty?
          res = res[0]
          res["old_pid"] = pid
          self.get_the_prob(res)
        else 
          puts "problem #{pid} not found"
        end
      end
    end
    def get_the_prob(prob)
        p = Problem.new
        p.name = prob["title"]
        p.description = prob["description"]
        p.input = prob["input"]
        p.output = prob["output"]
        p.example_input = prob["sample_input"]
        p.example_output = prob["sample_output"]
        p.source = "原TIOJ#{prob["old_pid"]}"
        if prob["source"].chomp != ''
          p.source << " / #{prob["source"]}"
        end
        p.hint = prob["hint"]
        p.old_pid = prob["old_pid"]
        p.visible_state = 2
        p.problem_type = 0
        p.save
    end
  end
end
