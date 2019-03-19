require "hanami/mongoid/version"
require "hanami/mongoid/repository"

module Hanami
  module Mongoid
    class Error < StandardError; end

    require "mongoid"
  end
end
