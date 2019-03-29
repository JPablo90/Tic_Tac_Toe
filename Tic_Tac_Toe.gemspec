
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Tic_Tac_Toe/version"

Gem::Specification.new do |spec|
  spec.name          = "Tic_Tac_Toe"
  spec.version       = TicTacToe::VERSION
  spec.authors       = ["JPablo90"]
  spec.email         = ["jp.garciamurillo@gmail.com"]

  spec.summary       = %q{Tic Tac Toe game}
  spec.description   = %q{This is a simulation of Tic Tac Toe game.}
  spec.homepage      = "https://github.com/JPablo90/Tic_Tac_Toe.git"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
