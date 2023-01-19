include ActionView::Helpers::NumberHelper

class ApplicationController < ActionController::Base
  def blank_square_form
    self.render({ :template => "calculation_templates/square_form.html.erb" })
  end

  def calculate_square
    @num = params.fetch("userInput")
    @squareOfNum = @num.to_f ** 2.0
    self.render({ :template => "calculation_templates/square_results.html.erb" })
  end

  def blank_square_root_form
    self.render({ :template => "calculation_templates/square_root_form.html.erb" })
  end

  def calculate_square_root
    @num = params.fetch("userInput")
    @squareRootOfNum = @num.to_f ** 0.5
    self.render({ :template => "calculation_templates/square_root_results.html.erb" })
  end

  def blank_random_form
    self.render({ :template => "calculation_templates/random_form.html.erb" })
  end

  def calculate_random
    @numMin = params.fetch("userMin").to_f
    @numMax = params.fetch("userMax").to_f
    @randomNum = rand(@numMin..@numMax)
    self.render({ :template => "calculation_templates/random_results.html.erb" })
  end

  def blank_payment_form
    self.render({ :template => "calculation_templates/payment_form.html.erb" })
  end

  def payment_results
    @numAPR = number_to_percentage(params.fetch("userApr"), precision: 4)
    monthlyApr = params.fetch("userApr").to_f / 12 / 100
    @numYears = params.fetch("userYears")
    months = @numYears.to_f * 12
    @numPV = number_to_currency(params.fetch("userPV").to_f)
    @paymentOutput = number_to_currency(params.fetch("userPV").to_f * (monthlyApr * (1 + monthlyApr) ** months) / (((1 + monthlyApr) ** months) - 1))
    self.render({ :template => "calculation_templates/payment_results.html.erb" })
  end
end
