require 'highline'
require 'rspec'
def capture_output(&block)
  original_stdout = $stdout
  $stdout = StringIO.new
  block.call
  $stdout.string
ensure
  $stdout = original_stdout
end

# RSpec.configure do |config|
#   config.expect_with :rspec do |expectations|
#     expectations.syntax = :expect
#   end
# end
