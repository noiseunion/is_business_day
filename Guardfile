guard 'rspec', :version => 2, :cli => '--color --format progress' do
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^lib/(.+)\.rb}) { |match| "spec/#{match[1]}_spec.rb" }
end