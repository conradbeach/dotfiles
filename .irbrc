if defined?(Rails) && Gem.loaded_specs["factory_bot"].present?
  require "factory_bot"
  include FactoryBot::Syntax::Methods
end
