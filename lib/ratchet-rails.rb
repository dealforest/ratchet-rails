require "ratchet/rails/version"

module Ratchet
  module Rails
    require 'ratchet/rails/engine' if defined?(Rails)
  end
end
