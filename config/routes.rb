Rails.application.routes.draw do
  # get("",{:controller => "", :action => ""})
  get("/square/results", { :controller => "application", :action => "calculate_square" })
  get("/square/new", { :controller => "application", :action => "blank_square_form" })
  get("/square_root/results", { :controller => "application", :action => "calculate_square_root" })
  get("/square_root/new", { :controller => "application", :action => "blank_square_root_form" })
  get("/random/new", { :controller => "application", :action => "blank_random_form" })
  get("/random/results", { :controller => "application", :action => "calculate_random" })
  get("/payment/new", { :controller => "application", :action => "blank_payment_form" })
  get("/payment/results", { :controller => "application", :action => "payment_results" })
end
