$LOAD_PATH.unshift File.expand_path("./lib", __dir__)
require "tiny_factory"

factory = TinyFactory.define :user do
  first_name { "Alexandre" }
  last_name { "Ruban" }
  email { "#{first_name}@hey.com".downcase }
end

p factory