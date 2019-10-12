class TestJobJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "i did something"
  end
end
