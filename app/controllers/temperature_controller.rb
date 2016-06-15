class TemperatureController < ApplicationController
  def index
    @degree = params[:sentence]
    @degreef = @degree.to_f * 9 / 5 + 32
  end

  # def convert
  #   @degree = params[:sentence]
  #   @degreef = @degree.to_f * 9 / 5 + 32
  # end
end
