Kaminari.configure do |config|
   config.default_per_page = 10
   config.max_per_page = nil
   config.window = 15
   config.outer_window = 3
   config.left = 0
   config.right = 0
   config.page_method_name = :page
   config.param_name = :page
end
