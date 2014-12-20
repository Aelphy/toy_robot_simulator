module ToyRobotSimulator
  module Ascii
    def red(text)
      "\e[0;31m#{text}\e[0m"
    end

    def green(text)
      "\e[0;32m#{text}\e[0m"
    end
  end
end
