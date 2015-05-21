require 'rulers/array'
require 'rulers/routing'
require 'rulers/version'

module Rulers
  class Application
    def call env
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, { 'Content-Type' => 'text/html' }, []]
      end

      if env['PATH_INFO'] == '/'
        return [
          302,
          { 'Content-Type' => 'text/html', 'Location' => 'http://google.com' },
          ['302 found']
        ]
      end

      klass, act = get_controller_and_action env
      controller = klass.new env
    begin
      text = controller.send act
    rescue
      return [500, { 'Content-Type' => 'text/html' }, ['Oops! An error occurred. [From Rulers]']]
    end

      [200, { 'Content-Type' => 'text/html' }, [text]]
    end
  end

  class Controller
    attr_reader :env

    def initialize env
      @env = env
    end
  end
end
