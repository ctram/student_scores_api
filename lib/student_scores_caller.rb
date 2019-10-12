require 'net/http'
require 'json'
require 'singleton'

class StudentScoresCaller
  include Singleton

  URL = "http://localhost:3000/student_scores"

  attr_accessor :store

  def initialize
    @store = []
  end

  def cache_student_scores
    uri = URI(URL)

    Thread.new do
      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri

        http.request request do |response|
          response.read_body do |chunk|
            data = chunk.chomp.match(/data: (\[.*\])/)
            p data[1] if data

            if data
              self.store += JSON.parse(data[1])
              # p store
            end
          end
        end
      end
    end
  end
end
