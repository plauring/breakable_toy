class GamesController < ApplicationController

  def update_schedule
    ScheduleWorker.perform_async
    render text: "Something is happening"
  end
end
