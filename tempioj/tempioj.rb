module TempIOJ
  require 'json'
  require 'open-uri'
  require 'net/http'
  require 'nokogiri'

  class ProbGetter
    def initialize(options = {})
      options = {
        :prob_url => 'http://icpc.csie.org:9898/hello', 
        :td_url => 'http://icpc.csie.org/~tmt514/TIOJdata',
        :test => false }.merge(options)
      @prob_url = options[:prob_url]
      @td_url = options[:td_url]
      @test = options[:test] # not commiting to db but print results on screen.
    end
    def get(pid)
      res = JSON.parse(Net::HTTP.get(URI("#{@prob_url}/#{pid}.json")))
      if not res.empty?
        res = res[0]
        res["old_pid"] = pid
        self.set_prob(res)
        self.set_td(res)
        self.set_td_sets(res)
      else 
        puts "problem #{pid} not found"
      end
    end

    def set_prob(prob)
      p = Problem.new
      p.name = "#{prob['old_pid']} - #{prob['title']}"
      p.tag_list.add "TIOJ"
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
      if self.test?
        p p
      else
        p.save
      end
      prob["problem"] = p
      return prob
    end
    def set_td(prob)
      p = prob["problem"]
      url = "#{@td_url}/#{p.old_pid}"
      page = Nokogiri::HTML(open(url))
      td_count = (page.css('tr').length - 4) / 2
      td_count.times do |i|
        td = p.testdata.build
        test_input = page.css('tr')[i*2+3].css('a')[0].attributes['href'].value
        test_output = page.css('tr')[i*2+4].css('a')[0].attributes['href'].value
        td.test_input = test_input
        td.test_output = test_output
        td.remote_test_input_url = "#{url}/#{test_input}"
        td.remote_test_output_url = "#{url}/#{test_output}"
        limit = td.build_limit
        limit.time = prob["time_limit"]
        limit.memory = prob["memory_limit"]
        if self.test?
          p td
          p limit
        else
          td.save
        end
      end
    end
    def set_td_sets(prob)
      p = prob["problem"]
      td_count = p.testdata.count
      if td_count == 0
        p "no testdata found"
        return 
      end
      scores = Array.new(td_count, 100 / td_count)
      scores[-1] += (100 % td_count)
      scores.each_with_index do |score, i|
        ts = p.testdata_sets.build
        ts.from = i
        ts.to = i
        ts.score = score
        if self.test?
          p ts
        else
          ts.save
        end
      end
      if not self.test?
        p.save
      end
    end
    def test?
      return @test
    end
  end
end
