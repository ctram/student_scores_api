require_relative '../../lib/student_scores_caller'

class StudentScoresController < ApplicationController
  def index
    render json: StudentScoresCaller.instance.store.to_json
  end
end
